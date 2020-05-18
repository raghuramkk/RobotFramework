*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  DataDriver     ${EXECDIR}/APIAutomation/TestData/Data.csv
Test Template  get_weatherinfo
*** Variables ***
${baseurl}  http://restapi.demoqa.com
#${city}     Delhi
*** Test Cases ***
Get vweather for city ${City}
*** Keywords ***
get_weatherinfo
    [Arguments]  ${City}
    create session  mysssion   ${baseurl}
    ${responce}=    get request     mysssion   /utilities/weather/city/${city}
#    log to console  ${responce.status_code}
#    log to console  ${responce.content}
#    log to console  ${responce.headers}
#   Validations
    ${status_code}=     convert to string  ${responce.status_code}
    should be equal     ${status_code}  200
    ${content}=     convert to string   ${responce.content}
    should contain  ${content}  ${City}
    ${header}=  get from dictionary     ${responce.headers}     Content-Type
    should be equal     ${header}   application/json