*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://demo.nopcommerce.com
${browser}  chrome
*** Test Cases ***
LoginTest
    set selenium speed  0.5seconds
    open browser    ${url}  ${browser}
    click link  xpath://a[@class='ico-login']
    LoginToApplication
    close browser
*** Keywords ***
LoginToApplication
    input text  id:Email    raghu@test.com
    input text  id:Password  Test@123
    click element   xpath://input[@class='button-1 login-button']

