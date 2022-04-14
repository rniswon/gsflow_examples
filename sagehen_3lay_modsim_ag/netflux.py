import numpy as np
import datetime as dt


class NetFlux(object):

    def __init__(self, f, precision='single', start_date="1-1-1970"):
        self.file = f
        self.header = [('kstp', '<i4'), ('kper', '<i4'), ('text', 'S16'),
                       ('ncol', '<i4'), ('nrow','<i4'), ('nlay', "<i4"),
                       ('imeth', '<i4'), ('delt', 'f4'), ('totim', 'f4'),
                       ('pertim', 'f4')]
        self.precision = precision
        if self.precision == 'single':
            self.realtype = np.float32
        else:
            self.realtype = np.float64
        m, d, y = [int(i) for i in start_date.split("-")]
        self.start_date = dt.datetime(y, m , d) - dt.timedelta(seconds=1)
        self._data = {}
        self._bydate = {}

        self.read_file()

    @property
    def data(self):
        """
        Gets a dictionary of data by (kper, kstp)
        """
        return self._data

    def read_file(self):
        with open(self.file, 'rb') as foo:
            foo.seek(0, 2)
            totalnbytes = foo.tell()
            foo.seek(0, 0)
            nbytes = foo.tell()
            date0 = self.start_date

            while nbytes < totalnbytes:
                header = self.binaryread(foo, self.header)
                nrow = int(header['nrow'][0])
                ncol = int(header['ncol'][0])
                kstp = int(header['kstp'][0])
                kper = int(header['kper'][0])

                shp = (nrow, ncol)
                array = self.binaryread(foo, self.realtype, shape=shp)

                if (kper, kstp) in self._data:
                    if self._data[(kper, kstp)].shape[0] == 2:
                        tarr = list(self._data[(kper, kstp)])
                        tarr = list(tarr)
                        tarr.append(array)
                    else:
                        tarr = list(tarr)
                        tarr.append(array)

                    array = np.array(tarr)

                self._data[(kper, kstp)] = array
                nbytes = foo.tell()

    @staticmethod
    def binaryread(file, vartype, shape=(1,), charlen=16):
        """
        Uses numpy to read from binary file.  This was found to be faster than the
            struct approach and is used as the default.

        """

        # read a string variable of length charlen
        if vartype == str:
            result = file.read(charlen * 1)
        else:
            # find the number of values
            nval = np.prod(shape)
            result = np.fromfile(file, vartype, nval)
            if nval == 1:
                result = result  # [0]
            else:
                result = np.reshape(result, shape)
        return result
