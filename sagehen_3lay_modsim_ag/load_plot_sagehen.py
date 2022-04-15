import gsflow
import flopy
import os
import numpy as np
import matplotlib.pyplot as plt
# to use the netflux module uncomment the next line
# from netflux import NetFlux

ws = os.path.abspath(os.path.dirname(__file__))
model_ws = os.path.join(ws, "windows")

gsf = gsflow.GsflowModel.load_from_file(os.path.join(model_ws, "gsflow.control"))

modflow = gsf.mf
prms = gsf.prms


ag_wells = modflow.ag.well_list
wells = np.zeros((modflow.nrow, modflow.ncol)) * np.nan
for well in ag_wells:
    wells[well.i, well.j] = 1

pmv = flopy.plot.PlotMapView(modflow, layer=1)
pmv.plot_grid(color="grey", alpha=0.25)
pmv.plot_bc("SFR", color="r")
pmv.plot_bc("LAK", color="b")
pmv.plot_array(wells, masked_values=[0,])
pmv.plot_ibound()
plt.show()
