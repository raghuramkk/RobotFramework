*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${baseurl}  http://localhost:8080

*** Test Cases ***
TC1: Return all videogames (GET)
    Create Session      mysession   ${baseurl}
    ${header}=  create dictionary   Content-Type=application/json
    ${responce} =       Get Request     mysession   /app/videogames     headers=${header}
    log to console      ${responce.status_code}
    log to console      ${responce.content}
    log to console      ${responce.headers}
    ${status}=      convert to string   ${responce.status_code}
    should be equal     ${status}   200

TC2: Post a new video game to DB (POST)
    create Session      mysession   ${baseurl}
    ${body}=    create dictionary   id=103  name=Pacman    releaseDate=2020-05-15T08:55:58.510Z    reviewScore=5   category=Adventure  rating=Universal
    ${header}=  create dictionary   Content-Type=application/json
    ${reponse}=     post request    mysession   /app/videogames   data=${body}     headers=${header}
    ${status}=      convert to string   ${reponse.status_code}
    ${data}=        convert to string   ${reponse.content}
    log to console      ${status}
    log to console      ${reponse.content}
    should be equal     ${status}   200
    should contain      ${data}     Record Added Successfully

TC3: Get Video Game data (Get)
    create session      mysession   ${baseurl}
    ${responce}=    get request     mysession   /app/videogames/101
    log to console      ${responce.status_code}
    log to console      ${responce.content}
    log to console      ${responce.headers}
    ${status}=      convert to string   ${responce.status_code}
    should be equal     ${status}   200

TC4: Chaange Video Game Name (Put)
    create session  mysession   ${baseurl}
    ${body}=    create dictionary   id=101  name=Assasins-Creed    releaseDate=2020-05-15T08:55:58.510Z    reviewScore=5   category=Adventure  rating=Universal
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=   put request     mysession   /app/videogames/101     data=${body}    headers=${header}
    ${status}=      convert to string   ${response.status_code}
    ${data}=        convert to string   ${response.content}
    log to console      ${status}
    log to console      ${response.content}
    should be equal     ${status}   200

TC5: Delete the record for the game 102 (Delete)
    create session  mysession    ${baseurl}
    ${responce}=    delete request  mysession   /app/videogames/102
    log to console      ${responce.status_code}
    log to console      ${responce.content}
    log to console      ${responce.headers}
    ${status}=      convert to string   ${responce.status_code}
*** Keywords ***
