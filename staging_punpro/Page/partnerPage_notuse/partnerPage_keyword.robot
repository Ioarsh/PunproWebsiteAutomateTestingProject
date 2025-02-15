*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./partnerPage_variable.robot
Resource   ../../default_keyword.robot
Resource   ../../Component/loginPopup/loginPopup_keyword.robot

*** Keywords ***
Login in partner page
    [Arguments]    ${username}    ${password}
    Click login with email
    Login as                                    ${username}  ${password}
    Wait Until Page Does Not Contain Element    ${login_section}
    Wait Until Location Is                      ${url_staging_punpro_partner_login}
    Wait Until Element Is Visible               ${partner_term}

Go to form page
    Scroll Element Into View    ${partner_next}
    Select Checkbox             ${partner_accept}
    Click Element               ${partner_next}
    Wait Until Page Contains    ฟอร์มการสมัครปันโปร Partner สำหรับแจ้งโปรใกล้ฉัน และ คูปอง