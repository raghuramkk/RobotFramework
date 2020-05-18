*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../WebAutomation/Resources/Resources.robot
*** Test Cases ***
Scrolling Test
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    https://www.countries-ofthe-world.com/flags-of-the-world.html   chrome
    maximize browser window
    execute javascript   window.scrollTo(0,1500)
    scroll element into view    xpath://table[1]//tbody[1]//tr[86]//td[1]//img[1]
    execute javascript   window.scrollTo(0,document.body.scrollHeight)
    execute javascript   window.scrollTo(0,-document.body.scrollHeight)
    sleep   5
    close browser