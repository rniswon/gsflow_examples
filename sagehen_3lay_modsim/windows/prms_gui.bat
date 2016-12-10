@ECHO OFF
..\..\bin\gsflow_prms5 -C.\sagehen_2lay.control -print
java -cp ..\..\dist\oui4.jar oui.mms.gui.Mms .\sagehen.control
ECHO.
ECHO Run complete. Please press enter to continue.
PAUSE>NUL
