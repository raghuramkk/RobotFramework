*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  XML
*** Variables ***
${baseurl}      http://jsonplaceholder.typicode.com
*** Test Cases ***
TC1: Validate Headers
    create session  mysession   ${baseurl}
    ${responce}=    get request     mysession   /photos
    ${body}=    convert to string   ${responce.content}
    ${header}=  convert to string   ${responce.headers}
    ${cookie}=  convert to string   ${responce.cookies}
    log to console  ${body}
    log to console  ${header}
    log to console  ${cookie}
    ${contenttype}=    get from dictionary     ${responce.headers}     Content-Type
    should be equal     ${contenttype}      application/json; charset=utf-8
    should not be empty     ${cookie}
    ${cookievalue}=     get from dictionary     ${responce.cookies}     __cfduid
    log to console      ${cookievalue}
*** Keywords ***
