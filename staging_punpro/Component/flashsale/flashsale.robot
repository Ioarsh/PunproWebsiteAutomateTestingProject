*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ./flashsale_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Flashsale - see all
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ดูทั้งหมด"
    Wait Until Page Contains Element    ${flashsale_slider}
    Scroll Element Into View            ${flashsale_slider}
    Wait Until Element Is Visible       ${flashsale_slider}
    Click Element                       ${flashsale_seeall}
    Wait Until Location Is              ${url_staging_punpro_promotion_online_flashsale}
    Location Should Be                  ${url_staging_punpro_promotion_online_flashsale}

Case 002 Flashsale - scroll
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการทำงานของ slider flashsale
    Wait Until Page Contains Element    ${flashsale_slider}
    Scroll Element Into View            ${flashsale_slider}
    Wait Until Element Is Visible       ${flashsale_slider}
    Drag And Drop By Offset             ${flashsale_slider}    -759    0
    Drag And Drop By Offset             ${flashsale_slider}    -1    0
    Drag And Drop By Offset             ${flashsale_slider}    760   0

Case 003 Flashsale - disable button
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการ disable ของปุ่มเลื่อนซ้าย-ขวา
    Wait Until Page Contains Element    ${flashsale_slider}
    Scroll Element Into View            ${flashsale_slider}

    #ตรวจปุ่มซ้าย
    Wait Until Element Is Visible    ${flashsale_button_left}
    ${button_clickable}=    Get Element Attribute    ${flashsale_button_left}    class
    ${button_clickable}=    get_second_class_part    ${button_clickable}
    Should Be Equal    ${button_clickable}    ${flashsale_button_disable}

    #ตรวจปุ่มขวา
    Wait Until Element Is Visible    ${flashsale_button_right}
    Drag And Drop By Offset          ${flashsale_slider}    -759    0
    Drag And Drop By Offset          ${flashsale_slider}    -1    0
    ${button_clickable}=    Get Element Attribute    ${flashsale_button_right}    class
    ${button_clickable}=    get_second_class_part    ${button_clickable}
    Should Be Equal    ${button_clickable}    ${flashsale_button_disable}

Case 004 Flashsale - buttonScroll - right
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบปุ่มการเลื่อนซ้าย
    Wait Until Page Contains Element    ${flashsale_slider}
    Scroll Element Into View            ${flashsale_slider}
    Wait Until Element Is Visible       ${flashsale_button_right}

    # ตรวจสอบลูกศรขวา
    ${style}=    Get Element Attribute    ${flashsale_slider}    style
    ${current_position}=    get_style_x_px    ${style}
    Click Element    ${flashsale_button_right}
    Sleep    0.5s
    ${style}=    Get Element Attribute    ${flashsale_slider}    style
    ${new_position}=    get_style_x_px    ${style}
    Should Be True    ${current_position} > ${new_position}

Case 005 Flashsale - buttonScroll - left
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบปุ่มการเลื่อนซ้าย
    Wait Until Page Contains Element    ${flashsale_slider}
    Wait Until Page Contains Element    ${flashsale_slider}
    Scroll Element Into View            ${flashsale_slider}
    Wait Until Element Is Visible       ${flashsale_button_left}

    # ตรวจสอบลูกศรซ้าย
    Drag And Drop By Offset    ${flashsale_slider}    -759    0
    ${style}=    Get Element Attribute    ${flashsale_slider}    style
    ${current_position}=    get_style_x_px    ${style}
    Log To Console    ${current_position}
    Click Element     ${flashsale_button_left}
    Sleep    0.5s
    ${style}=    Get Element Attribute    ${flashsale_slider}    style
    ${new_position}=    get_style_x_px    ${style}
    Should Be True    ${current_position} < ${new_position}

Case 006 FlashSale - card - link - pic
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ Flashsale
    Check card link (class)   ${flashsale_card_firstcard_pic}

Case 007 FlashSale - card - link - text
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ Flashsale
    Check card link (class)    ${flashsale_card_firstcard_text}

Case 008 Flashsale - card - like - not login
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ Flashsale
    Click Login Needed    ${flashsale_card_firstcard_like}

Case 009 Flashsale - card - like - login
    [Tags]    Flashsale
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ Flashsale
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Element Is Not Visible    ${login_popup_modal}
    Check card like number    ${flashsale_card_firstcard_like}    ${flashsale_card_firstcard_like_count}

# Case 000 Flashsale - Time