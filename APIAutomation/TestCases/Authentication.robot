*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  XML
Library  os
Library  OperatingSystem
*** Variables ***
${baseurl}  http://restapi.demoqa.com
${baseurl1}     https://certtransaction.elementexpress.com/
${Bearer_Token}     "Bearer    E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"
${baseurl2}     https://maps.googleapis.com
${uri2}     /maps/api/place/nearbysearch/json?
${apikey}   AIzaSyDYAoCVaRc0A3iPma62OcSPM_ar_vHSCk0
*** Test Cases ***
TC1: Baisc Authentication Test
    ${auth}=    create list     ToolsQA     TestPassword
    create session  mysession   ${baseurl}  auth=${auth}
    ${responce}=    get request  mysession  /authentication/CheckForAuthentication/
    ${content}=     to json   ${responce.content}
    log to console  ${content}
    ${status}=  get value from json     ${content}     $.Fault
    should contain any   ${status[0]}    success
    should be equal as strings      ${responce.status_code}     200
    log to console          ${responce.status_code}

TC2: APIKey Authentication test
    create session  mysession   ${baseurl2}
    ${params}   create dictionary   location=-33.8670522,151.1957362    radius=500      types=food      name=harbour    key=${apikey}
    ${reponse}=     get request     mysession   ${uri2}     params=${params}
    log to console  ${reponse.content}
    log to console  ${reponse.status_code}
*** Keywords ***
