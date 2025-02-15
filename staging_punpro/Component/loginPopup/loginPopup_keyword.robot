*** Settings ***
Library           SeleniumLibrary
Resource          ./loginPopup_variable.robot
Resource          ../topbar/topbar_keyword.robot
Resource          ../../default_keyword.robot

*** Keywords ***

Open login popup on mainpage and login in with email
    [Tags]    Login
    Open login popup on mainpage
    Click login with email

Open login popup on mainpage
    [Tags]    Login
    Open web browser (maximize)    ${url_staging_punpro}    ${browser_chrome}
    Open login popup

Login as
    [Tags]    Login
    [Arguments]      ${username}    ${password}
    Input Text       ${login_email_emailField}       ${username}
    Input Text       ${login_email_passwordField}    ${password}
    Click Element    ${login_email_enter}

Close login popup
    [Tags]    Login
    Wait Until Element Is Visible    ${login_close}
    Click Element                    ${login_close}

Click register
    [Tags]    Login
    Wait Until Element Is Visible    ${login_register}
    Click Element                    ${login_register}

Click login with email
    [Tags]    Login
    Wait Until Element Is Visible    ${login_email}
    Wait Until Keyword Succeeds    10x    0.1s    Click Element    ${login_email}

Click cancel
    [Tags]    Login
    Wait Until Element Is Visible    ${login_email_cancel}
    Click Element                    ${login_email_cancel}

Click forgot password 
    [Tags]    Login
    Wait Until Element Is Visible    ${login_email_forgot}
    Click Element                    ${login_email_forgot}

Login Fail - Wrong email format
    [Tags]    Login
    [Arguments]    ${email}    ${password}
    Login as    ${email}    ${password}
    Wait Until Page Contains    The email address is badly formatted.
    Wait Until Element Is Visible    ${login_fail_close}
    Click Element                    ${login_fail_close}

Click Login Needed
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Scroll Element Into View            ${locator}
    Wait Until Element Is Visible       ${locator}
    Click Element                       ${locator}
    Wait Until Element Is Visible       ${login_popup_modal}
    Element Should Be Visible           ${login_popup_modal}

