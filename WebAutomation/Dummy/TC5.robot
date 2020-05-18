*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../WebAutomation/Resources/Resources.robot
*** Variables ***
${url}  http://demo.automationtesting.in/Windows.html
${browser}  chrome
${url1}     www.google.com

*** Test Cases ***
Tabbed window test
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    ${url}  ${browser}
    maximize browser window
    Check_And_Click_Link    xpath://a[contains(text(),'Open New Tabbed Windows')]
    Check_And_Click_Button  xpath://div[@id='Tabbed']//button[@class='btn btn-info'][contains(text(),'click')]

    Select_Window_If_Exists     title:Sakinalium | Home
#    select window   title:Sakinalium | Home
    Check_And_Click_Button    xpath://ul[@class='nav navbar-nav navbar-right']//a[contains(text(),'Contact')]
#    close browser
    close window
    Select_Window_If_Exists     title:Frames & windows
    Check_And_Click_Link    xpath://a[contains(text(),'Open New Seperate Windows')]
    Check_And_Click_Button    //button[@class='btn btn-primary']
    Select_Window_If_Exists     title:Sakinalium | Home
    Check_And_Click_Button  //ul[@class='nav navbar-nav navbar-right']//a[contains(text(),'Contact')]
    close window
    close all browsers
