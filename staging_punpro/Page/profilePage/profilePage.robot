*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ./profilePage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open browser, Maximize and Login withinpage   ${url_staging_punpro_profile}     ${browser_chrome}    ${username}   ${password}
Test Teardown     Close Browser

*** Test Cases ***

Case 001 Not Login
    [Tags]    Profile
    [Documentation]    ตรวจสอบหน้าแก้ไขข้อมูลส่วนตัวเมื่อยังไม่ได้ทำการล็อกอิน
    [Setup]   Open web browser (maximize) and accept cookies   ${url_staging_punpro_profile}     ${browser_chrome}
    Element Should Be Visible        ${login_section}
    
Case 002 Login
    [Tags]    Profile
    [Documentation]    ตรวจสอบหน้าแก้ไขข้อมูลส่วนตัวเมื่อทำการล็อกอิน
    No Operation

Case 003 Logout
    [Tags]    Profile
    [Documentation]    ตรวจสอบการออกจากระบบในหน้า "แก้ไขข้อมูลส่วนตัว"
    Log out

Case 004 First Page
    [Tags]    Profile
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 005 Tab - Bookmarks
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานของแถบ "บุ๊คมาร์ค"
    Change tab              ${tab_bookmarks}    ${url_staging_punpro_bookmarks}

Case 006 Tab - Coupon
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานของแถบ "คูปอง"
    Change tab              ${tab_coupon}    ${url_staging_punpro_my_coupons}

Case 007 Tab - Privacy
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานของแถบ "ตั้งค่าความเป็นส่วนตัว"
    Change tab              ${tab_privacy}    ${url_staging_punpro_privacy}

Case 008 Profile - Upload Pic
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานการอัพโหลดรูปโปรไฟล์
    Wait Until Page Contains Element    ${profile_picture}
    Scroll Element Into View            ${profile_picture}
    Wait Until Element Is Visible       ${profile_picture}
    ##########################################################################
    #เปลี่ยนรูปตรงนี้
    ${picture_path}=    Set Variable    C:/Users/ASUS/Pictures/download.jpg
    ##########################################################################
    Choose File    ${profile_picture_input}    ${picture_path}
    Sleep    3s

Case 009 Profile - Save
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "บันทึกข้อมูล"
    Wait Until Page Contains Element    ${profile_save}
    Scroll Element Into View            ${profile_save}
    Wait Until Element Is Visible       ${profile_save}
    Click Element                       ${profile_save}
    Wait Until Element Is Visible       ${popup}

Case 010 Profile - Fail
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานการบันทึกข้อมูลในกรณีที่บันทึกข้อมูลไม่สำเร็จ
    [Template]    Test Scenario - Save - Fail
    #name       day         month       year        gender( not specified, male, female)      telephone
    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}                                  ${EMPTY}

Case 011 Profile - Success
    [Tags]    Profile
    [Documentation]    ตรวจสอบการทำงานการบันทึกข้อมูลในกรณีที่บันทึกข้อมูลสำเร็จ
    [Template]    Test Scenario - Save - Success
    #name       day         month       year        gender( not_specified, male, female)      telephone
    tester      ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}                                  ${EMPTY}
    tester      1           12          2000        ${EMPTY}                                  ${EMPTY}
    tester      ${EMPTY}    ${EMPTY}    ${EMPTY}    male                                      ${EMPTY}
    tester      ${EMPTY}    ${EMPTY}    ${EMPTY}    female                                    ${EMPTY}
    tester      ${EMPTY}    ${EMPTY}    ${EMPTY}    not_specified                             ${EMPTY}
    tester      ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}                                  098123456
    tester      2           9           2002        male                                      ${EMPTY}
    tester      3           7           2010        ${EMPTY}                                  095987654
    tester      ${EMPTY}    ${EMPTY}    ${EMPTY}    female                                    098123456
    tester      24          5           2005        not_specified                             085789456