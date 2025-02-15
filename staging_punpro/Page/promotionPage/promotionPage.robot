*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./promotionPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_promotion}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 First Page
    [Tags]    Promotion
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

# Case 002 Pin - scrolling - ข้อมูลไม่พอ
#     [Tags]    Pin
#     [Documentation] ตรวจสอบการเลื่อนซ้าย-ขวา ของ "โปรปักหมุด"

Case 003 Pin - card - link - pic
    [Tags]    Pin
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ "โปรปักหมุด"
    Check card link (class)    ${pin_card_first_pic}

Case 004 Pin - card - link - text
    [Tags]    Pin
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ "โปรปักหมุด"
    Check card link (class)    ${pin_card_first_text}

Case 005 Pin - card - hover
    [Tags]    Pin
    [Documentation]    ตรวจสอบการปรากฎของปุ่ม share เมื่อทำการวางเมาส์ไปที่รูปใน card
    Wait Until Element Is Visible    ${pin_card_first_banner}
    Mouse Over                       ${pin_card_first_banner}
    Wait Until Element Is Visible    ${pin_card_first_share}

Case 006 Pin - card - share
    [Tags]    Pin
    [Documentation]    ตรวจสอบปุ่ม share ของ card
    Wait Until Element Is Visible    ${pin_card_first_banner}
    Mouse Over                       ${pin_card_first_banner}
    Wait Until Element Is Visible    ${pin_card_first_share}
    Click Element                    ${pin_card_first_share}
    Element Should Be Visible        ${pin_card_first_facebook}
    Element Should Be Visible        ${pin_card_first_x}
    Element Should Be Visible        ${pin_card_first_line}

Case 007 Promotion - Type
    [Tags]    Promotion
    [Documentation]    ตรวจสอบแถบเลือกประเภทของโปรโมชั่น
    [Template]    Test Scenario - Tab
    ${tab_1get1}     buy1-get1-free
    ${tab_50}        sale-50p-up
    ${tab_phone}     mobile-phone
    ${tab_food}      food
    ${tab_ticket}    ticket
    ${tab_code}      discount

Case 008 Promotion - card - link - pic
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ "โปรโมชัน"
    Check card link (xpath)    ${firstcard_pic}   

Case 009 Promotion - card - link - text
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ "โปรโมชัน"
    Check card link (xpath)    ${firstcard_text}

Case 010 Promotion - card - hover
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการปรากฎของปุ่ม share เมื่อทำการวางเมาส์ไปที่รูปใน card
    Wait Until Element Is Visible    ${firstcard_banner}
    Mouse Over                       ${firstcard_banner}
    Wait Until Element Is Visible    ${firstcard_share}

Case 011 Promotion - card - share
    [Tags]    Promotion
    [Documentation]    ตรวจสอบปุ่ม share ของ card
    Wait Until Element Is Visible    ${firstcard_banner}
    Mouse Over                       ${firstcard_banner}
    Wait Until Element Is Visible    ${firstcard_share}
    Click Element                    ${firstcard_share}
    Element Should Be Visible        ${firstcard_facebook}
    Element Should Be Visible        ${firstcard_x}
    Element Should Be Visible        ${firstcard_line}

Case 012 Promotion - card - like - not login
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ card "โปรโมชัน"
    Click Login Needed    ${firstcard_like}

Case 013 Promotion - card - like - login
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ card "โปรโมชัน"
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Check card like (second class)    ${firstcard_like}    ${like_active}    ${like_inactive}
    
Case 014 Promotion - card - bookmark - not login
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการคลิกบุ๊คมาร์คในขณะที่ยังไม่ได้ login ของ card "โปรโมชัน"
    Click Login Needed    ${firstcard_bookmark}

Case 015 Promotion - card - bookmark - login
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการคลิกบุ๊คมาร์คในขณะ login ของ card "โปรโมชัน"
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Check card like (second class)    ${firstcard_bookmark}    ${bookmark_active}    ${bookmark_inactive}

Case 016 Promotion - loading
    [Tags]    Promotion
    [Documentation]    ตรวจสอบการโหลด card เพิ่มเมื่อ scroll ไปสิ้นสุด
    Wait Until Page Contains Element    ${tab_container}
    Scroll Element Into View    ${promotion_container}
    ${child}=    Get WebElements    ${promotion_container}/div
    ${number} =    Get Length    ${child}
    Execute JavaScript    window.scrollBy(0, 2000)
    ${child}=    Get WebElements    ${promotion_container}/div
    ${current_number} =    Get Length    ${child}
    Should Be True    ${current_number} > ${number}
