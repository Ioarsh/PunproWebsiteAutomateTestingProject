*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./articlePage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_article}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 First Page
    [Tags]    Article
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 002 Article - Type
    [Tags]    Article
    [Documentation]    ตรวจสอบแถบเลือกประเภทของบทความ
    [Template]    Test Scenario - Tab
    ${tab_fashion}    pro-fashion
    ${tab_eat}        pro-eat
    ${tab_travel}     pro-travel
    ${tab_smart}      pro-smart
    ${tab_update}     pro-update
    ${tab_talking}    pro-talking

Case 003 Article - card - link - pic
    [Tags]    Article
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ "บทความทั้งหมด"
    Check card link (class)    ${firstcard_pic}

Case 004 Article - card - link - text
    [Tags]    Article
    [Documentation]    ตรวจสอบการคลิกข้อความใน card ของ "บทความทั้งหมด"
    Check card link (class)    ${firstcard_text}

Case 005 Article - card - like - not login
    [Tags]    Article
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ card "บทความ"
    Click Login Needed    ${firstcard_like}

Case 006 Article - card - like - login
    [Tags]    Article
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ card "บทความ"
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Check card like number    ${firstcard_like}    ${firstcard_like_count}

Case 007 Article - card - share
    [Tags]    Article
    [Documentation]    ตรวจสอบปุ่ม share ของ card
    Scroll Element Into View         ${firstcard_share}
    Wait Until Element Is Visible    ${firstcard_share}
    Click Element                    ${firstcard_share}
    Element Should Be Visible        ${firstcard_facebook}
    Element Should Be Visible        ${firstcard_x}
    Element Should Be Visible        ${firstcard_line}
    Element Should Be Visible        ${firstcard_clipboard}

Case 008 Article - card - share - clipboard
    [Tags]    Article
    [Documentation]    ตรวจสอบการทำงานของปุ่ม copy clipboard 
    Scroll Element Into View           ${firstcard_share}
    Wait Until Element Is Visible      ${firstcard_share}
    Click Element                      ${firstcard_share}
    Wait Until Element Is Visible      ${firstcard_clipboard}
    ${text}=    Get Element Attribute    ${firstcard_clipboard}    clipboard-text
    Click Element                      ${firstcard_clipboard}
    ${clipboard_text} =    Execute JavaScript    navigator.clipboard.readText().then(text => {return text;})
    Should Be Equal    ${text}    ${clipboard_text}
    
Case 009 Article - card - hover
    [Tags]    Article
    [Documentation]    ตรวจสอบ card เมื่อนำเมาส์ไปวาง
    Scroll Element Into View         ${firstcard_pic}
    Wait Until Element Is Visible    ${firstcard_pic}
    Mouse Over                       ${firstcard_pic}
    Wait Until Element Is Visible    ${firstcard_bookmark}

Case 010 Article - card - bookmark - not login
    [Tags]    Article
    [Documentation]    ตรวจสอบการคลิก bookmark ในขณะที่ยังไม่ได้ login ของ card "โปรโมชัน"
    Scroll Element Into View         ${firstcard_pic}
    Wait Until Element Is Visible    ${firstcard_pic}
    Mouse Over                       ${firstcard_pic}
    Wait Until Element Is Visible    ${firstcard_bookmark}
    Click Login Needed               ${firstcard_bookmark}
    
Case 011 Article - card - bookmark - login
    [Tags]    Article
    [Documentation]    ตรวจสอบการคลิก bookmark ในขณะที่ login ของ card "โปรโมชัน"
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Scroll Element Into View                    ${firstcard_text}
    ${name}=    Get Text    ${firstcard_text} a h2
    Scroll Element Into View                    ${firstcard_pic}
    Wait Until Element Is Visible               ${firstcard_text}
    Wait Until Element Is Visible               ${firstcard_pic}
    Mouse Over                                  ${firstcard_pic}
    Wait Until Element Is Visible               ${firstcard_bookmark}
    Click Element                               ${firstcard_bookmark}
    Mouse Over                                  ${firstcard_text}
    Mouse Over                                  ${firstcard_pic}
    Wait Until Page Does Not Contain Element    ${firstcard_bookmark_inactive}
    Wait Until Page Contains Element            ${firstcard_bookmark_active}
    Click Element                               ${firstcard_bookmark}
    Mouse Over                                  ${firstcard_text}
    Mouse Over                                  ${firstcard_pic}
    Wait Until Page Does Not Contain Element    ${firstcard_bookmark_active}
    Wait Until Page Contains Element            ${firstcard_bookmark_inactive}
    Click Element                        ${firstcard_bookmark}
    Execute JavaScript    window.scrollTo(0, 0);
    Wait Until Element Is Visible        ${topbar_username}
    Click Element                        ${topbar_username}
    Wait Until Location Is               ${url_staging_punpro_bookmarks}
    Page Should Contain    ${name}


Case 012 Article - loading
    [Tags]    Article
    [Documentation]    ตรวจสอบการโหลดข้อมูลเพิ่มหลังจากเลื่อนลงไปสุด
    Wait Until Page Contains Element    ${article_container}
    Scroll Element Into View    ${article_container}
    ${child}=    Get WebElements    ${article_container}/div
    ${number} =    Get Length    ${child}
    Execute JavaScript    window.scrollBy(0, 2000)
    ${child}=    Get WebElements    ${article_container}/div
    ${current_number} =    Get Length    ${child}
    Should Be True    ${current_number} > ${number}

