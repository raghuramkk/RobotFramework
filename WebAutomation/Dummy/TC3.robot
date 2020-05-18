*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../WebAutomation/Resources/Resources.robot
*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  chrome
*** Test Cases ***
Practice_Test_Chai_Form_RB_CB_DD_MS_Lnk_Txt_Wait
    set selenium speed  0.1seconds
    set selenium timeout    20 seconds
    set selenium implicit wait  10 seconds
    open browser    ${url}  ${browser}
    maximize browser window
    Validate_Page_Title     practice-form
    Check_And_Click_Link    //strong[contains(text(),'Automation Form')]
    go back
    Validate_And_Set_Text   name:firstname  Raghuram
    Validate_And_Set_Text   name:lastname   Krishnakumar
    Validate_And_Select_Radiobutton     sex      Female
    Validate_And_Select_Radiobutton     exp      7
    Validate_And_Select_Checkbox    BlackTea;;RedTea    ;;
    Validate_And_Select_Checkbox    Break;;Harmless Addiction   ;;
    Validate_And_Select_Dropdown_By_Label    continents  Asia
    Validate_And_Select_Multiselect_By_Label    selenium_commands   Browser Commands;;Switch Commands   ;;
    Check_And_Click_Button  submit
    close browser
