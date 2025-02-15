*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./promotionOnlinePage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_promotion_online}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Highlight - slider highlight
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการทำงานของ highlight slider
    Check highlight slider    ${highlight_slider_active}    ${highlight_slider_prev}    -300
    Check highlight slider    ${highlight_slider_active}    ${highlight_slider_next}    300

Case 002 Highlight - slider highlight - auto
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการเลื่อนของ highlight slider โดยอัติโนมัติ
    Wait Until Element Is Visible    ${highlight_slider_active}
    ${init_index} =    Get Element Attribute    ${highlight_slider_active}    data-swiper-slide-index
    Sleep    3s
    Wait Until Page Contains Element    ${highlight_slider_active}
    ${new_index} =    Get Element Attribute    ${highlight_slider_active}   data-swiper-slide-index
    Should Not Be Equal    ${init_index}    ${new_index}

Case 003 Highlight - slider highlight - right button
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการทำงานของปุ่มเลื่อนขวาของ highlight
    Check button    ${highlight_btn_right}

Case 004 Highlight - slider highlight - left button
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการทำงานของปุ่มเลื่อนซ้ายของ highlight
    Check button    ${highlight_btn_left}

Case 005 Highlight - slider highlight - link
    [Tags]    Highlight
    [Documentation]    ตรวจสอบลิงค์ของโพสต์ที่อยู่ใน slider
    Wait Until Element Is Visible    ${highlight_slider_active}
    ${link} =    Get Element Attribute    ${highlight_slider_active}//div//a    href
    Click Element                    ${highlight_slider_active}
    Wait Until Location Contains     ${link}
    Location Should Be               ${link}

Case 006 Promotion Online - card - link - pic
    [Tags]    Promotion Online
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ Promotion Online
    Check card link (class)    ${promotion_online_first_pic}

Case 007 Promotion Online - card - link - text
    [Tags]    Promotion Online
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ Promotion Online
    Check card link (class)    ${promotion_online_first_text}

Case 008 Promotion Online - card - like - not login
    [Tags]    Promotion Online
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ card Promotion Online
    Click Login Needed     ${promotion_online_first_like}

Case 009 Promotion Online - card - like - login
    [Tags]    Promotion Online
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ card Promotion Online
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Check card like number    ${promotion_online_first_like}    ${promotion_online_frist_like_count}