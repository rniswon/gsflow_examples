@ECHO OFF
..\..\bin\gsflow_prms5 -C.\sagehen_2lay_gsflow.control -print
java -cp ..\..\..\lib\oui4.jar;..\..\..\lib\AbsoluteLayout.jar;..\..\..\lib\jcommon-1.0.16.jar;..\..\..\lib\jfreechart-1.0.13.jar oui.mms.gui.Mms .\gsflow.control
ECHO.
ECHO Run complete. Please press enter to continue.
PAUSE>NUL
