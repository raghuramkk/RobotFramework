*** Settings ***
Library  SeleniumLibrary
Library  String
Variables  ${EXECDIR}/WebAutomation/PageObjects/Locators.py
Resource  ${EXECDIR}/WebAutomation/Resources/Resources.robot
*** Keywords ***
Open My Browser
    [Arguments]     ${url}     ${browser}
    open browser    ${url}  ${browser}
    maximize browser window

Enter Username
    [Arguments]  ${username}
#    input text  ${txt_Login_Username}   ${username}
    Validate_And_Set_Text   ${txt_Login_Username}   ${username}
Enter Password
    [Arguments]  ${password}
#    input text  ${txt_Login_Password}   ${password}
    Validate_And_Set_Text   ${txt_Login_Password}   ${password}

Submit Credentials
#    click button    ${btn_Login_Signin}
    Check_And_Click_Button  ${btn_Login_Signin}

Verify Successful Login
#    title should be     Find a Flight: Mercury Tours:
    Validate_Page_Title     Find a Flight: Mercury Tours:

Click Singnin Link
    Check_And_Click_Link    ${lnk_Login_Sgnin}

Close my Browser
    close all browsers