@ECHO OFF

..\..\..\bin\gsflow .\gsflow_prms.control -set init_vars_from_file 0 -set save_vars_to_file 0 -set model_output_file ..\output\prms\prms.out
ECHO.
ECHO Run complete. Please press enter when you want to continue.
PAUSE>NUL