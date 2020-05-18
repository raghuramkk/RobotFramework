*** Settings ***
Library  SeleniumLibrary
Library     String
Resource  ../WebAutomation/Resources/Resources.robot
*** Variables ***
${url}  https://testautomationpractice.blogspot.com/
${browser}  chrome
${url1}     https://seleniumhq.github.io/selenium/docs/api/java/index

*** Test Cases ***
Practice_Test_TestAutomation_Blogspot_Alrt_Frame
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
#    open browser    ${url}  ${browser}
    open browser    ${url1}     ${browser}
    maximize browser window
#    Check_And_Click_Button    xpath://button[contains(text(),'Click Me')]
#    handle alert    DISMISS
    select frame    packageListFrame
    click link  com.thoughtworks.selenium
    unselect frame
    select frame    packageFrame
    click link  Selenium
    unselect frame
    select frame    classFrame
    click link  Help
    unselect frame
#    Click_Link_In_Frame     packageListFrame    com.thoughtworks.selenium
#    Click_Link_In_Frame     packageFrame    //span[contains(text(),'Selenium')]
#    Click_Link_In_Frame     classFrame  Help
