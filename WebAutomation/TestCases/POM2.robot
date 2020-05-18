*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ${EXECDIR}/WebAutomation/Resources/LoginKeywords.robot
Resource  ${EXECDIR}/WebAutomation/Resources/RegistrationKeywords.robot
Library  DataDriver     file=${EXECDIR}/WebAutomation/TestData/data.csv
Test Template   Register Test
*** Variables ***
${browser}  headlesschrome
${url}  http://newtours.demoaut.com/
#${username}     tutorial
#${password}     tutorial
*** Test Cases ***
Test Registration with POM & DataDriver with ${username} & ${password}

*** Keywords ***
Register Test
    [Arguments]     ${firstname}    ${lastname}     ${phone}    ${email}    ${Add1}     ${Add2}     ${City}     ${State}    ${Zipcode}  ${Country}  ${username}     ${password}
    Open My Browser     ${url}      ${browser}
    Navigate To Registration
    Validate Registration Page
    Enter FirstName     ${firstname}
    Enter LastName      ${lastname}
    Enter Phone     ${phone}
    Enter Email     ${email}
    Enter Address1  ${Add1}
    Enter Address2  ${Add2}
    Enter City  ${City}
    Enter State     ${State}
    Enter Zipcode   ${Zipcode}
    Select Country  ${Country}
    Enter Reg Username  ${username}
    Enter Reg Password  ${password}
    Enter ConfirmPwd    ${password}
    Submit Registration
    Close my Browser
