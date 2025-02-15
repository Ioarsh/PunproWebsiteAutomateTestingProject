*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ./privacyPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open browser, Maximize and Login withinpage   ${url_staging_punpro_privacy}     ${browser_chrome}    ${username}   ${password}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Not Login
    [Tags]    Privacy
    [Documentation]    ตรวจสอบหน้าแก้ไขข้อมูลส่วนตัวเมื่อยังไม่ได้ทำการล็อกอิน
    [Setup]   Open web browser (maximize) and accept cookies   ${url_staging_punpro_profile}     ${browser_chrome}
    Element Should Be Visible        ${login_section}
    
Case 002 Login
    [Tags]    Privacy
    [Documentation]    ตรวจสอบหน้าแก้ไขข้อมูลส่วนตัวเมื่อทำการล็อกอิน
    No Operation

Case 003 First Page
    [Tags]    Privacy
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 004 Tab - Bookmarks
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการทำงานของแถบ "บุ๊คมาร์ค"
    Change tab              ${tab_bookmarks}    ${url_staging_punpro_bookmarks}

Case 005 Tab - Coupon
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการทำงานของแถบ "คูปอง"
    Change tab              ${tab_coupon}    ${url_staging_punpro_my_coupons}

Case 006 Tab - Profile
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการทำงานของแถบ "แก้ไขข้อมูลส่วนตัว"
    Change tab              ${tab_profile}    ${url_staging_punpro_profile}

Case 007 Delete button
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ขอลบบัญชี"
    Wait Until Page Contains Element    ${privacy_delete}
    Scroll Element Into View            ${privacy_delete}
    Wait Until Element Is Visible       ${privacy_delete}
    Click Element                       ${privacy_delete}
    Wait Until Element Is Visible       ${privacy_popup}

Case 008 Deletion - Textfield
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการทำงานของ textfield กรุณาระบุสาเหตุในการลบ
    Wait Until Page Contains Element    ${privacy_delete}
    Scroll Element Into View            ${privacy_delete}
    Wait Until Element Is Visible       ${privacy_delete}
    Click Element                       ${privacy_delete}
    Wait Until Element Is Visible       ${privacy_popup}
    Input Text    ${privacy_delete_textfield}    testing text
    ${input_text}=    Get Text    ${privacy_delete_textfield}
    Should Be Equal As Strings    ${input_text}    testing text

Case 009 Deletion - Cancel
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "เป็นสมาชิกต่อไป"
    Wait Until Page Contains Element     ${privacy_delete}
    Scroll Element Into View             ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_delete}
    Click Element                        ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_popup}
    Wait Until Element Is Visible        ${privacy_delete_cancel}
    Click Element                        ${privacy_delete_cancel}
    Wait Until Element Is Not Visible    ${privacy_popup}
    
Case 010 Deletion - No Text and No Check Box
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการลบบัญชีเมื่อไม่ได้ใส่สาเหตุการลบและกด checkbox
    Wait Until Page Contains Element     ${privacy_delete}
    Scroll Element Into View             ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_delete}
    Click Element                        ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_popup}
    Wait Until Element Is Visible        ${privacy_delete_confirm}
    Click Element                        ${privacy_delete_confirm}
    Element Should Be Visible            ${privacy_popup}

Case 011 Deletion - No Text
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการลบบัญชีเมื่อไม่ได้ใส่สาเหตุการลบ
    Wait Until Page Contains Element     ${privacy_delete}
    Scroll Element Into View             ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_delete}
    Click Element                        ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_popup}
    Select Checkbox                      ${privacy_delete_checkbox}
    Wait Until Element Is Visible        ${privacy_delete_confirm}
    Click Element                        ${privacy_delete_confirm}
    Element Should Be Visible            ${privacy_popup}

Case 012 Deletion - No Checkbox
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการลบบัญชีเมื่อไม่ได้กด checkbox
    Wait Until Page Contains Element     ${privacy_delete}
    Scroll Element Into View             ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_delete}
    Click Element                        ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_popup}
    Input Text    ${privacy_delete_textfield}    testing text
    Wait Until Element Is Visible        ${privacy_delete_confirm}
    Click Element                        ${privacy_delete_confirm}
    Element Should Be Visible            ${privacy_popup}

Case 013 Deletion - Complete
    [Tags]    Privacy
    [Documentation]    ตรวจสอบการลบบัญชีสำเร็จ
    Wait Until Page Contains Element     ${privacy_delete}
    Scroll Element Into View             ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_delete}
    Click Element                        ${privacy_delete}
    Wait Until Element Is Visible        ${privacy_popup}
    Input Text    ${privacy_delete_textfield}    testing text
    Select Checkbox                      ${privacy_delete_checkbox}
    Wait Until Element Is Visible        ${privacy_delete_confirm}
    Click Element                        ${privacy_delete_confirm}
    Wait Until Page Contains             ได้รับคำขอลบสมาชิกแล้ว ทีมงานจะติดต่อกลับและดำเนินการโดยเร็ว
    Wait Until Element Is Visible        ${popup_confirm}
    Click Element                        ${popup_confirm}
    Wait Until Element Is Not Visible    ${popup}
    Wait Until Location Is               ${url_staging_punpro}