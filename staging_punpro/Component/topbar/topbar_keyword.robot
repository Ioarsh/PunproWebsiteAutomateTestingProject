*** Settings ***
Library    SeleniumLibrary
Resource    ./topbar_variable.robot
Resource    ../loginPopup/loginPopup_variable.robot

*** Keywords ***
Open login popup
    [Tags]    Default
    Wait Until Element Is Visible    ${topbar_login}
    Click Element    ${topbar_login}
    Wait Until Element Is Visible    ${login_popup_modal}
