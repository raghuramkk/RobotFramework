*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  os
*** Variables ***
${baseurl}  https://restcountries.eu
*** Test Cases ***
TC1: Validate Json from file
    ${json}=    load json from file     ${EXECDIR}/APIAutomation/TestData/TestJson.json
    ${name_value}=  get value from json     ${json}     $.firstName
    log to console      ${name_value}
    log to console      ${name_value[0]}
    ${PhoneValue}=  get value from json     ${json}     $.phoneNumbers
    ${PhoneTypeValue}=  get value from json     ${json}     $.phoneNumbers[0].type
    log to console  ${PhoneValue}
    log to console  ${PhoneTypeValue}

TC2: Json validation from request
    create session  mysession   ${baseurl}
    ${response}=    get request     mysession   /rest/v2/alpha/IN
    ${jsoncontent}=     to json     ${response.content}

    # Single data validation
    ${name}=    get value from json     ${jsoncontent}  $.name
    log to console      ${name[0]}
    should be equal     ${name[0]}     India
    ${borders}=     get value from json     ${jsoncontent}  $.borders[0]
    log to console  ${borders[0]}
    should be equal     ${borders[0]}   AFG
    ${borders1}=     get value from json     ${jsoncontent}  $.borders
    log to console  ${borders1[0]}
    should contain any      ${borders1[0]}     AFG     MMR     LKA     PAK
*** Keywords ***
