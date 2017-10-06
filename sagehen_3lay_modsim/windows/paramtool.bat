@ECHO OFF
C:\Workspace\gsflow.git\modsim.git\MODSIM_GSFLOW_C\bin\x86\Debug\MODSIM_GSFLOW_C .\gsflow_prms.control -print
java -cp ..\..\..\..\dist\oui4.jar oui.paramtool.ParamTool ..\input\prms\sagehen_grid_prms.params .\gsflow_prms.control.par_name
ECHO.
ECHO Run complete. Please press enter to continue.
PAUSE>NUL
