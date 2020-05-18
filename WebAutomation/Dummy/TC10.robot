*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ${EXECDIR}/WebAutomation/Resources/Resources.robot
*** Variables ***
${url}  https://testautomationpractice.blogspot.com/
${browser}  chrome
*** Test Cases ***
Web Table Test
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    ${url}  ${browser}
    maximize browser window
    log to console  ${EXECDIR}
    scroll element into view    xpath://table[@name='BookTable']
    ${iRowcnt} =    get element count   xpath://table[@name='BookTable']/tbody/tr
    ${iColCnt} =    get element count   xpath://table[@name='BookTable']/tbody/tr[1]/th
    log to console  ${iRowcnt}
    log to console  ${iColCnt}
#    Handle_Row  xpath://table[@name='BookTable']    ${iRowcnt}  ${iColCnt}
    FOR     ${i}    IN RANGE    1   ${iRowcnt}
#        log to console  ${oTableElement}
#        ${oElement} =   catenate    SEPARATOR=  ${oTableElement}    /tbody/tr[${i}]
#        log to console  xpath://table[@name='BookTable']/tbody/tr[${i}]
        Handle_Column       xpath://table[@name='BookTable']/tbody/tr[${i}]    ${iColCnt}
    END
*** Keywords ***
#Handle_Row
#    [Arguments]  ${oTableElement}   ${iRowcnt}  ${iColCnt}
#    FOR     ${i}    IN RANGE    1   ${iRowcnt}
#        log to console  ${oTableElement}
#        ${oElement} =   catenate    SEPARATOR=  ${oTableElement}    /tbody/tr[${i}]
#        log to console  ${oElement}
#        Handle_Column   ${oElement}    ${iColCnt}
#    END

Handle_Column
    [Arguments]     ${oTableElement}    ${iColoumCnt}
    For     ${j}    IN RANGE    1   ${iColoumCnt}
        log to column   ${oTableElement}
        ${oTabElement} =    catenate    SEPARATOR=  ${oTableElement}    /td[${j}]
        log to console  ${oTabElement}
        ${Val} =    get text    {oTabElement}
        log to console  ${Val}
    END
