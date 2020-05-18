*** Settings ***
Library  XML
Library  Collections
Library  os
Library  RequestsLibrary
*** Variables ***
${baseurl}  http://thomas-bayer.com
*** Test Cases ***
TC1: Validate XML from File
    ${response}=    parse XML   ${EXECDIR}/APIAutomation/TestData/TestXml.xml
    ${FirstName1}=    get element text     ${response}     .//employee[1]/firstname
    should be equal     ${FirstName1}   Jane
TC2: Get Element
    ${response}=    parse XML   ${EXECDIR}/APIAutomation/TestData/TestXml.xml
    ${element1}=    get element   ${response}     .//employee[1]/firstname
    should be equal     ${element1.text}   Jane

TC3: Element Text Should be
    ${response}=    parse XML   ${EXECDIR}/APIAutomation/TestData/TestXml.xml
    element text should be      ${response}     Jane    .//employee[1]/firstname

TC4: Get Element Count
    ${response}=    parse XML   ${EXECDIR}/APIAutomation/TestData/TestXml.xml
    ${empcnt}=    Get element count     ${response}     .//employee
    log to console      ${empcnt}
    ${FN}=    Get element count     ${response}     .//employee/firstname
    log to console      ${FN}
    FOR     ${i}    IN RANGE    1   ${FN}
        ${Val}=     Get element text     ${response}     .//employee[${i}]/firstname
        log to console      ${Val}
    END
TC5: Validate XML from Response
    create session  mysession   ${baseurl}
    ${response}=    get request     mysession   /sqlrest/CUSTOMER/15
    ${strResp}=     convert to string   ${response.content}
    log to console  ${strResp}
    ${xmlResp}=     parse xml       ${strResp}
    ${val}=     get element text    ${xmlResp}  .//FIRSTNAME
    log to console  ${val}
    ${val2}=    get elements   ${xmlResp}     .//
    log to console  ${Val2}
    ${elecnt}=    get element count     ${xmlResp}  .//
    log to console  ${elecnt}
    FOR     ${i}    IN RANGE    0     ${elecnt}-1
        ${val1}=    get element text    ${val2[${i}]}
        log to console  ${val1}
    END
*** Keywords ***
