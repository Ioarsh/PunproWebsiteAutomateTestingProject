*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./couponsPage_variable.robot
Resource   ../../default_keyword.robot

*** Keywords ***
Click first coupons post
    [Tags]    Coupons
    Wait Until Element Is Visible    ${coupons_first_title}
    ${name}=    Get Text    ${coupons_first_title}
    Wait Until Element Is Visible    ${coupons_first_collect}
    ${link}=    Get Element Attribute    ${coupons_first_collect}    href
    Click Element                    ${coupons_first_collect}
    Wait Until Location Is           ${link}
    Wait Until Page Contains         ${name}

Click coupons button (xpath)
    [Tags]    Coupons
    [Arguments]    ${post}
    Wait Until Page Contains Element    ${post}
    Scroll Element Into View            ${post}
    Wait Until Element Is Visible       ${post}/div/div/h5
    ${name}=    Get Text    ${post}/div/div/h5
    Wait Until Element Is Visible       ${post}/div/div/a
    ${link}=    Get Element Attribute    ${post}/div/div/a   href
    Click Element                       ${post}/div/div/a
    Wait Until Location Is              ${link}
    Wait Until Page Contains            ${name}