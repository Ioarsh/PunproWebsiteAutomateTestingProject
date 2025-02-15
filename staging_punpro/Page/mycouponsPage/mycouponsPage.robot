*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ./mycouponsPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_my_coupons}     ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***

Case 001 Not Login
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบหน้าคูปองเมื่อยังไม่ได้ทำการล็อกอิน
    Element Should Be Visible        ${login_section}
    
Case 002 Login
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบหน้าคูปองเมื่อทำการล็อกอิน
    Login within page as    ${username}   ${password}

Case 003 Logout
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบการออกจากระบบในหน้า "คูปอง"
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

Case 005 Tab - Bookmarks
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบการทำงานของแถบ "บุ๊คมาร์ค"
    Login within page as    ${username}   ${password}
    Change tab              ${tab_bookmarks}    ${url_staging_punpro_bookmarks}

Case 006 Tab - Profile
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบการทำงานของแถบ "แก้ไขข้อมูลส่วนตัว"
    Login within page as    ${username}   ${password}
    Change tab              ${tab_profile}    ${url_staging_punpro_profile}

Case 007 Tab - Privacy
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบการทำงานของแถบ "ตั้งค่าความเป็นส่วนตัว"
    Login within page as    ${username}   ${password}
    Change tab              ${tab_privacy}    ${url_staging_punpro_privacy}

Case 008 Use Coupon - cancel
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบการใช้งานคูปอง กรณียกเลิกการใช้
    Login within page as                 ${username}   ${password}
    Wait Until Element Is Visible        ${coupons_first_use}
    Click Element                        ${coupons_first_use}
    Wait Until Element Is Visible        ${coupons_detail}
    Wait Until Element Is Visible        ${coupons_using}
    Click Element                        ${coupons_using}
    Wait Until Element Is Visible        ${coupons_using_popup}
    Wait Until Element Is Visible        ${coupons_using_cancel}
    Click Element                        ${coupons_using_cancel}
    Wait Until Element Is Not Visible    ${coupons_using_popup}
    Element Should Be Visible            ${coupons_detail}
    Element Should Not Be Visible        ${coupons_using_popup}

Case 009 Use Coupon - accept - barcode/tab
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการใช้งานคูปอง กรณียืนยันการใช้
    Login within page as                 ${username}   ${password}
    Wait Until Element Is Visible        ${coupons_first_use}
    Click Element                        ${coupons_first_use}
    Wait Until Element Is Visible        ${coupons_detail}
    Wait Until Element Is Visible        ${coupons_using}
    Click Element                        ${coupons_using}
    Wait Until Element Is Visible        ${coupons_using_popup}
    Wait Until Element Is Visible        ${coupons_using_confirm}
    Click Element                        ${coupons_using_confirm}
    Wait Until Page Contains Element     ${coupons_using_qrcode}
    Scroll Element Into View             ${coupons_using_qrcode}
    Click Element                        ${coupons_using_tab_barcode}
    Wait Until Element Is Visible        ${coupons_using_barcode}
    Click Element                        ${coupons_using_tab_qrcode}
    Wait Until Element Is Visible        ${coupons_using_qrcode}
    Click Element                        ${coupons_using_close}
    Wait Until Element Is Not Visible    ${coupons_using_popup}

Case 010 Coupon - Using
    [Tags]    My Coupons
    [Documentation]    ตรวจสอบการทำงานเมื่อกดใช้คูปอง (ชื่อต้องไม่ซ้ำ)
    Login within page as                 ${username}   ${password}
    #เปลี่ยน locator ของคูปองตรงนี้
    ##########################################
    ${selected_coupons}=    Set Variable    xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div/div[1]/div
    ##########################################
    Wait Until Page Contains Element     ${selected_coupons}
    Scroll Element Into View             ${selected_coupons}
    ${name}=    Get Text    ${selected_coupons}/div/div/h5
    Scroll Element Into View             ${selected_coupons}/div/div/button
    Wait Until Element Is Visible        ${selected_coupons}/div/div/button
    Click Element                        ${selected_coupons}/div/div/button
    Wait Until Element Is Visible        ${coupons_detail}
    Wait Until Element Is Visible        ${coupons_using}
    Click Element                        ${coupons_using}
    Wait Until Element Is Visible        ${coupons_using_popup}
    Wait Until Element Is Visible        ${coupons_using_confirm}
    Click Element                        ${coupons_using_confirm}
    Wait Until Element Is Visible        ${coupons_using_close}
    Click Element                        ${coupons_using_close}
    Wait Until Element Is Not Visible    ${coupons_using_popup}
    Wait Until Page Contains Element     locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Scroll Element Into View             locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Wait Until Element Is Visible        locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    ${text}=    Get Text    locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Should Be Equal As Strings    ${text}    ใช้ไปแล้ว