*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./bookmarksPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_bookmarks}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Not Login
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบหน้าบุ๊คมาร์คเมื่อยังไม่ได้ทำการล็อกอิน
    Element Should Be Visible        ${login_section}
    
Case 002 Login
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบหน้าบุ๊คมาร์คเมื่อทำการล็อกอิน
    Login within page as    ${username}   ${password}

Case 003 Logout
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการออกจากระบบในหน้า "บุ๊คมาร์ค"
    Login within page as    ${username}   ${password}
    Log out

Case 004 First Page
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Login within page as              ${username}   ${password}
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 005 Tab - Coupon
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการทำงานของแถบ "คูปอง"
    Login within page as    ${username}   ${password}
    Change tab              ${tab_coupon}    ${url_staging_punpro_my_coupons}

Case 006 Tab - Profile
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการทำงานของแถบ "แก้ไขข้อมูลส่วนตัว"
    Login within page as    ${username}   ${password}
    Change tab              ${tab_profile}    ${url_staging_punpro_profile}

Case 007 Tab - Privacy
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการทำงานของแถบ "ตั้งค่าความเป็นส่วนตัว"
    Login within page as    ${username}   ${password}
    Change tab              ${tab_privacy}    ${url_staging_punpro_privacy}

Case 008 Card - link - pic
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของหน้า "บุ๊คมาร์ค"
    Login within page as          ${username}   ${password}
    Check card link (class)       ${firstcard_pic}

Case 009 Card - link - text
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการคลิกข้อความใน card ของหน้า "บุ๊คมาร์ค"
    Login within page as          ${username}   ${password}
    Check card link (class)       ${firstcard_text}

Case 010 Card - share
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการคลิกข้อความใน card ของหน้า "บุ๊คมาร์ค"
    Login within page as                ${username}   ${password}
    Wait Until Page Contains Element    ${firstcard_pic}
    Scroll Element Into View            ${firstcard_pic}
    Wait Until Element Is Visible       ${firstcard_pic}
    Mouse Over                          ${firstcard_pic}
    Wait Until Element Is Visible       ${firstcard_share}
    Click Element                       ${firstcard_share}
    Wait Until Element Is Visible       ${firstcard_facebook}
    Wait Until Element Is Visible       ${firstcard_x}
    Wait Until Element Is Visible       ${firstcard_line}

Case 011 Card - like
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการคลิกปุ่ม "like"
    Login within page as                ${username}   ${password}
    Wait Until Page Contains Element    ${firstcard_like}
    Scroll Element Into View            ${firstcard_like}
    Wait Until Element Is Visible       ${firstcard_like}
    Click Element                       ${firstcard_like}
    Sleep                               0.5s
    Click Element                       ${firstcard_like}

Case 012 Card - bookmark
    [Tags]    Bookmarks
    [Documentation]    ตรวจสอบการคลิกปุ่ม "bookmark"
    Login within page as                ${username}   ${password}
    Wait Until Page Contains Element    ${firstcard_text}
    Scroll Element Into View            ${firstcard_text}
    Wait Until Element Is Visible       ${firstcard_text}
    Wait Until Element Is Visible       ${firstcard_bookmark}
    ${name}=    Get Text   ${firstcard_text} a h2
    Click Element                       ${firstcard_bookmark}
    Element Text Should Not Be          ${firstcard_text} a h2    ${name}