*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./mycouponsPage_variable.robot
Resource   ../../default_keyword.robot
Resource   ../../Component/loginPopup/loginPopup_keyword.robot

*** Keywords ***
Login within page as
    [Arguments]    ${username}    ${password}
    Element Should Be Visible    ${login_section}
    Click login with email
    Login as                     ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_section}

Change tab
    [Arguments]    ${tab}    ${location}
    Wait Until Element Is Visible    ${tab}
    Click Element                    ${tab}
    Wait Until Location Is           ${location}

Log out
    Wait Until Page Contains Element    ${logout}
    Scroll Element Into View            ${logout}
    Wait Until Element Is Visible       ${logout}
    Click Element                       ${logout}
    Wait Until Location Is              ${url_staging_punpro}