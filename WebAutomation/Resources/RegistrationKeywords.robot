*** Settings ***
Library  SeleniumLibrary
Library  String
Variables  ${EXECDIR}/WebAutomation/PageObjects/Locators.py
Resource  ${EXECDIR}/WebAutomation/Resources/Resources.robot
*** Keywords ***
Navigate To Registration
    Check_And_Click_Link    ${lnk_Reg}

Validate Registration Page
    Validate_Page_Title     Register: Mercury Tours

Enter FirstName
    [Arguments]  ${sFirstname}
    Validate_And_Set_Text   ${txt_Reg_FirstName}    ${sFirstname}

Enter LastName
    [Arguments]  ${sFirstname}
    Validate_And_Set_Text   ${txt_Reg_LastName}    ${sFirstname}

Enter Phone
    [Arguments]  ${sPhone}
    Validate_And_Set_Text   ${txt_Reg_Phone}    ${sPhone}

Enter Email
    [Arguments]  ${Email}
    Validate_And_Set_Text   ${txt_Reg_Email}    ${Email}

Enter Address1
    [Arguments]  ${Add1}
    Validate_And_Set_Text   ${txt_Reg_Add1}    ${Add1}

Enter Address2
    [Arguments]  ${Add2}
    Validate_And_Set_Text   ${txt_Reg_Add2}    ${Add2}

Enter City
    [Arguments]  ${City}
    Validate_And_Set_Text   ${txt_Reg_City}    ${City}

Enter State
    [Arguments]  ${State}
    Validate_And_Set_Text   ${txt_Reg_State}    ${State}

Enter Zipcode
    [Arguments]  ${Zipcode}
    Validate_And_Set_Text   ${txt_Reg_Zipcode}    ${Zipcode}

Select Country
    [Arguments]  ${State}
    Validate_And_Select_Dropdown_By_Label   ${dpdn_Reg_Cntry}    ${State}

Enter Reg Username
    [Arguments]  ${username}
    Validate_And_Set_Text   ${txt_Reg_Username}    ${username}

Enter Reg Password
    [Arguments]  ${password}
    Validate_And_Set_Text   ${txt_Reg_Pwd}    ${password}

Enter ConfirmPwd
    [Arguments]  ${cnfpassword}
    Validate_And_Set_Text   ${txt_Reg_ConfPwd}    ${cnfpassword}

Submit Registration
    Check_And_Click_Button  ${btn_Reg_Submit}