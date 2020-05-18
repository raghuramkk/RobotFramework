cd E:\Workspace\Robot
set mydate=%date%
pabot --processes 2 --outputdir Result/%date% %time~0,8% WebAutomation/TestCases/*.robot
pause

