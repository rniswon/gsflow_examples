@ECHO OFF

..\..\..\bin\prms_5  .\gsflow_prms.control -print

java -cp C:\Workspace\dist\oui4.jar oui.mms.gui.Mms .\gsflow_prms.control

ECHO.
ECHO Run complete. Please press enter to continue.
PAUSE>NUL
