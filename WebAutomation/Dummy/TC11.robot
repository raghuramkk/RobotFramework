*** Settings ***
Library  SeleniumLibrary
Resource    ${EXECDIR}/WebAutomation/Resources/Resources.robot
Library     DataDriver  file=${EXECDIR}/WebAutomation/TestData/testdata.csv
Test Template   Test For Login

*** Variables ***
${url}  https://demo.nopcommerce.com
${browser}  chrome

*** Test Cases ***
Login Test using ${username} & ${password}


*** Keywords ***
Test For Login
    [Arguments]  ${username}    ${password}
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    ${url}  ${browser}
    Validate_Page_Title  nopCommerce demo store
    Check_And_Click_Link    xpath://a[@class='ico-login']
    Validate_And_Set_Text   id:Email    ${username}
    Validate_And_Set_Text   id:Password     ${password}
    Check_And_Click_Link    xpath://input[@class='button-1 login-button']
    Error_Message_Should_Be_Visible
#    Dashboard_Page_Should_be_Visible
#    Check_And_Click_Link    Logout
    close browser
