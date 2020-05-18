*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../WebAutomation/Resources/Resources.robot
*** Variables ***
${url}  https://testautomationpractice.blogspot.com/
${browser}  chrome
*** Test Cases ***
Practice Dragdrop doubleclick & rightclick
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    ${url}  ${browser}
    maximize browser window
    DBClick_Element  //button[contains(text(),'Copy Text')]
    Drag_And_Drop_Element   //p[contains(text(),'Drag me to my target')]    //div[@id='droppable']
    close browser
