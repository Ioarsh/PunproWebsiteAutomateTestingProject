*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./privacyPage_variable.robot
Resource   ../../default_keyword.robot
Resource   ../../Component/loginPopup/loginPopup_keyword.robot
Resource   ../../Component/cookiesPopup/cookiesPopup_keyword.robot

*** Keywords ***
Login within page as
    [Arguments]    ${username}    ${password}
    Element Should Be Visible    ${login_section}
    Click login with email
    Login as                     ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_section}

Open browser, Maximize and Login withinpage
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open web browser (maximize) and accept cookies    ${url}    ${browser}
    Login within page as    ${username}    ${password}

Change tab
    [Arguments]    ${tab}    ${location}
    Wait Until Element Is Visible    ${tab}
    Click Element                    ${tab}
    Wait Until Location Is           ${location}
