f = open(r'F:\Ag-MAR\MS-MF_wR_Extended\MF\modsim.out','r')

evap = []
i = 0

for line in f:
    if '      PRECIP     EVAPORATION    ' in line:
        i += 1
        line = f.next()
        evap.append(float(line[60:75]))
        print(str(i))

f.close()

f = open(r'F:\Ag-MAR\MS-MF_wR_Extended\MF\Evap_Summary.txt','w')
for i in range(len(evap)):
    f.write("{0:d}".format(i+1) + '   ' + "{0:.2f}".format(evap[i]) + '\n')

f.close()

