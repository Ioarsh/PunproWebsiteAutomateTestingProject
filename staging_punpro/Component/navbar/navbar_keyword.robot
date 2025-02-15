*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    ../../../utility.py
Resource    ./navbar_variable.robot
Resource    ../../default_keyword.robot

*** Keywords ***

Test Scenario - Search in navbar
    [Tags]    Navbar
    [Arguments]    ${text}
    Search    ${text}
    Go Back

Search
    [Tags]    Navbar
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${navbar_search}
    ${encode_text} =    Encode String to URL    ${text}
    Input Text    ${navbar_search}    ${text}
    Press Keys    ${navbar_search}    ENTER
    Wait Until Location Is    ${url_staging_punpro_searched}${encode_text}
    Location Should Be        ${url_staging_punpro_searched}${encode_text}
