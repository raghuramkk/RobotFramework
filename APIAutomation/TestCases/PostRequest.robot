*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  DataDriver     ${EXECDIR}/APIAutomation/TestData/TestData.csv
Test Template   Post_CustomerReg
*** Variables ***
${baseurl}      http://restapi.demoqa.com/customer
*** Test Cases ***
Validate User Registration with Username ${Username}
*** Keywords ***
Post_CustomerReg
    [Arguments]     ${FirstName}    ${LastName}     ${Username}     ${Password}     ${Email}
    create session      mysession   ${baseurl}
    ${body}=    create dictionary   FirstName=${FirstName}  LastName=${LastName}    UserName=${Username}    Password=${Password}    Email=${Email}
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request    mysession   /register   data=${body}     headers=${header}
    ${body}=    convert to string   ${response.content}
    ${head}=    convert to string   ${response.status_code}
    log to console  ${response.content}
    Run Keyword And Continue On Failure     should contain  ${body}     Success
    log to console  ${response.status_code}
    Run Keyword And Continue On Failure     should be equal     ${head}     201
