*** Settings ***
Library  SeleniumLibrary
Library  String
Resource    ../WebAutomation/Resources/Resources.robot

*** Variables ***

*** Test Cases ***
GetAllLinksTest
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    http://www.newtours.demoaut.com   chrome
    maximize browser window
    ${LnkCnt} =   get element count   xpath://a
    log to console  ${LnkCnt}
    @{LnkTxt} =   create list
    FOR     ${lnk}      IN RANGE     1     ${LnkCnt}+1
       ${LnkText}=     get text    xpath:(//a)[${lnk}]
       log to console  ${LnkText}
       Append To List      ${LnkTxt}   ${LnkText}
    END
    log to console  ${LnkTxt}
    close browser