@ECHO OFF

..\..\..\bin\gsflow .\Tahoe.control -set init_vars_from_file 0 -set gsflow_output_file ..\output\gsflow_cont.out -set csv_output_file ..\output\gsflow_cont.csv


ECHO.
ECHO Run complete. Please press enter when you want to continue.
PAUSE>NUL