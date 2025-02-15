*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./promotionOnlinePage_variable.robot
Resource   ../../default_keyword.robot

*** Keywords ***
######### Highlight #########
Check highlight slider
    [Tags]    Highlight
    [Arguments]    ${current}    ${new}    ${direction}
    Wait Until Element Is Visible    ${current}
    ${init_index} =    Get Element Attribute    ${current}    data-swiper-slide-index
    Drag And Drop By Offset    ${current}    ${direction}    0
    Sleep    1s
    Wait Until Page Contains Element    ${new}
    ${new_index} =    Get Element Attribute    ${new}   data-swiper-slide-index
    Should Be Equal    ${init_index}    ${new_index}

Check button
    [Tags]    Hightlight
    [Arguments]    ${button}
    Wait Until Element Is Visible       ${highlight_slider_active}
    ${init_index} =    Get Element Attribute    ${highlight_slider_active}    data-swiper-slide-index
    Wait Until Element Is Visible       ${button}
    Click Element                       ${button}
    Wait Until Page Contains Element    ${highlight_slider_active}
    ${new_index} =    Get Element Attribute    ${highlight_slider_active}   data-swiper-slide-index
    Should Not Be Equal                 ${init_index}    ${new_index}