*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ${EXECDIR}/WebAutomation/Resources/LoginKeywords.robot
Resource  ${EXECDIR}${EXECDIR}/WebAutomation/Resources/RegistrationKeywords.robot
Library  DataDriver     file=${EXECDIR}/WebAutomation/TestData/testdata.csv
Test Template   Login Test
*** Variables ***
${browser}  headlessfirefox
#$chrome
${url}  http://newtours.demoaut.com/
#${username}     tutorial
#${password}     tutorial
*** Test Cases ***
Test Login POM & DataDriver with ${username} & ${password}

*** Keywords ***
Login Test
    [Arguments]     ${username}     ${password}
    Open My Browser     ${url}      ${browser}
    Click Singnin Link
    Enter Username  ${username}
    Enter Password  ${password}
    Submit Credentials
    Verify Successful Login
    Close my Browser