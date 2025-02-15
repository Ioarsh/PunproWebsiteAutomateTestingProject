*** Settings ***
Library     SeleniumLibrary
Resource    ./cookiesPopup_variable.robot
Resource    ../../default_keyword.robot

*** Keywords ***
Open web browser (maximize) and accept cookies
    [Tags]    Cookies
    [Arguments]    ${url}    ${browser}
    Open web browser (maximize)    ${url}    ${browser}
    Accept cookies

Accept cookies
    [Tags]    Cookies
    Wait Until Element Is Visible        ${cookie_accept}
    Click Element                        ${cookie_accept}
    Wait Until Element Is Not Visible    ${cookie_session}