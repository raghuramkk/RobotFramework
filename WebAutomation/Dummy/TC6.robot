*** Settings ***
Library  SeleniumLibrary
*** Variables ***
*** Test Cases ***
Browser test
    set selenium speed  0.5 seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    https://www.google.com  chrome
    open browser    https://www.bing.com    ff
    switch browser  1
    ${tit1} =    get title
    log to console  ${tit1}
    ${loc1} =   get location
    log to console  ${loc1}
    switch browser  2
    ${tit2} =    get title
    log to console  ${tit2}
    ${loc2} =   get location
    log to console  ${loc2}
    switch browser  1
    go to   https://www.bing.com
    ${tit1} =    get title
    log to console  ${tit1}
    ${loc1} =   get location
    log to console  ${loc1}
    go back
    ${tit1} =    get title
    log to console  ${tit1}
    ${loc1} =   get location
    log to console  ${loc1}
    switch browser  2
    go to   https://www.google.com
    ${tit2} =    get title
    log to console  ${tit2}
    ${loc2} =   get location
    log to console  ${loc2}
    go back
    ${tit2} =    get title
    log to console  ${tit2}
    ${loc2} =   get location
    log to console  ${loc2}
    close all browsers
*** Keywords ***
