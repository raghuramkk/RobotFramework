*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../WebAutomation/Resources/Resources.robot
*** Variables ***
${url}  https://demo.nopcommerce.com
${browser}  chrome
*** Test Cases ***
Validate_Property_Perform_Action
    set selenium speed  0.5seconds
    open browser    ${url}  ${browser}
    maximize browser window
    Validate_Page_Title  nopCommerce demo store
    Check_And_Click_Link    xpath://a[@class='ico-login']
    Validate_And_Set_Text   id:Email    raghu@test.com
    Validate_And_Set_Text   id:Password     Test@123
    Check_And_Click_Link    xpath://input[@class='button-1 login-button']
    close browser
