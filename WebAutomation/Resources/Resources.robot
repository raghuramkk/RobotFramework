*** Settings ***
Library  SeleniumLibrary
Library  String

*** Keywords ***
Validate_Page_Title
    [Arguments]     ${sPagetitle}
    ${res}  title should be     ${sPagetitle}
    [Return]    ${res}
Check_And_Click_Link
    [Arguments]  ${olinkelement}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${olinkelement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${olinkelement}
#    log to console  ${bValidation2}
    should be true  ${bValidation1} and ${bValidation2}
    click element   ${olinkelement}

Validate_And_Set_Text
    [Arguments]     ${oTextelement}    ${sTexttoSet}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${oTextelement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oTextelement}
#    log to console  ${bValidation2}
    should be true  ${bValidation1} and ${bValidation2}
#    log to console  ${sTexttoSet}
    input text  ${oTextelement}     ${sTexttoSet}

Validate_And_Select_Radiobutton
    [Arguments]  ${oRBElement}  ${ValuetoSelect}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${oRBElement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oRBElement}
#    log to console  ${bValidation2}
    ${bValidation3}     set variable    element attribute value should be   ${oRBElement}   value   ${ValuetoSelect}
#    log to console  ${bValidation3}
    should be true  ${bValidation1} and ${bValidation2} and ${bValidation3}
    select radio button     ${oRBElement}   ${ValuetoSelect}

Validate_And_Select_Checkbox
    [Arguments]  ${CBstoSelect}     ${delimiter}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${val}  set variable    ${empty}
    @{Values} =  split string    ${CBstoSelect}     ${delimiter}
    FOR    ${val}  IN  @{Values}
        ${bValidation1}     set variable    element should be visible   ${val}
#    log to console  ${bValidation1}
        ${bValidation2}     set variable    element should be enabled    ${val}
#    log to console  ${bValidation2}
        should be true  ${bValidation1} and ${bValidation2}
        select checkbox     ${val}
    END

Validate_And_Select_Dropdown_By_Label
    [Arguments]  ${oDDElement}  ${ValuetoSelect}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${oDDElement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oDDElement}
#    log to console  ${bValidation2}
    ${bValidation3}     set variable    element attribute value should be   ${oDDElement}   value   ${ValuetoSelect}
#    log to console  ${bValidation3}
    should be true  ${bValidation1} and ${bValidation2} and ${bValidation3}
    select from list by label   ${oDDElement}   ${ValuetoSelect}

Validate_And_Select_Multiselect_By_Label
    [Arguments]  ${oMSElement}  ${ValuetoSelect}    ${delimter}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${val}  set variable    ${empty}
    @{Values}   split string    ${ValuetoSelect}    ${delimter}
    ${bValidation1}     set variable    element should be visible   ${oMSElement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oMSElement}
    FOR     ${val}  IN      @{Values}
#    log to console  ${bValidation2}
        ${bValidation3}     set variable    element attribute value should be   ${oMSElement}   value   ${val}
        log to console  ${bValidation3}
        should be true  ${bValidation1} and ${bValidation2} and ${bValidation3}
        select from list by label   ${oMSElement}   ${val}
    END

Check_And_Click_Button
    [Arguments]  ${oBtnElement}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${oBtnElement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oBtnElement}
#    log to console  ${bValidation2}
    should be true  ${bValidation1} and ${bValidation2}
    click element   ${oBtnElement}

Select_Window_If_Exists
    [Arguments]  ${oWndElement}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${Val}  set variable    ${empty}
    @{Names} =  get window titles
    log to console  @{Names}
    ${Val} =     get lines containing string    @{Names}    ${oWndElement}
    log to console  ${Val}
#    should be true  ${Val}>0
    select window   ${oWndElement}

DBClick_Element
    [Arguments]  ${oBtnElement}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${oBtnElement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oBtnElement}
#    log to console  ${bValidation2}
    should be true  ${bValidation1} and ${bValidation2}
#    SeleniumLibrary.Double Click Element   ${oBtnElement}
    double click element   ${oBtnElement}

Drag_And_Drop_Element
    [Arguments]  ${oSourceElement}  ${oTargetElement}
    ${bValidation1}     set variable    ${empty}
    ${bValidation2}     set variable    ${empty}
    ${bValidation3}     set variable    ${empty}
    ${bValidation4}     set variable    ${empty}
    ${bValidation1}     set variable    element should be visible   ${oSourceElement}
#    log to console  ${bValidation1}
    ${bValidation2}     set variable    element should be enabled    ${oSourceElement}
#    log to console  ${bValidation2}
    ${bValidation3}     set variable    element should be visible   ${oTargetElement}
#    log to console  ${bValidation1}
    ${bValidation4}     set variable    element should be enabled    ${oTargetElement}
    should be true  ${bValidation1} and ${bValidation2} and ${bValidation3} and ${bValidation4}
    drag and drop   ${oSourceElement}   ${oTargetElement}

Error_Message_Should_Be_Visible
    page should contain     Login was unsuccessful

Dashboard_Page_Should_be_Visible
    page should contain     Dashboard

#Open_Browser1
#    open browser  ${url}    ${browser}
#    maximize browser window