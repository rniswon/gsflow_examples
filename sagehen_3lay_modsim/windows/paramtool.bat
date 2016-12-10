@ECHO OFF
..\..\bin\gsflow_prms5 -C.\sagehen_2lay.control -print
java -cp ..\..\dist\oui4.jar oui.paramtool.ParamTool ..\input\prms\prms.params .\sagehen.control.par_name
ECHO.
ECHO Run complete. Please press enter to continue.
PAUSE>NUL
