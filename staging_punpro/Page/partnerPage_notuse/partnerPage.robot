*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./partnerPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_partner_notlogin}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Not login
    [Tags]    Partner
    [Documentation]    ตรวจสอบการเข้าหน้า "พาร์ทเนอร์" เมื่อไม่ได้ล็อกอิน
    Element Should Be Visible        ${login_section}
    Page Should Not Contain    รายละเอียดและเงื่อนไข การรับสมัคร Punpro Partner

Case 002 Login within page
    [Tags]    Partner
    [Documentation]    ตรวจสอบการ login เข้าหน้า "พาร์ทเนอร์" โดยใช้หน้า login ในหน้า
    Login in partner page    ${username}   ${password}

Case 003 Login outside page
    [Tags]    Partner
    [Documentation]    ตรวจสอบการ login เข้าหน้า "พาร์ทเนอร์" โดยใช้หน้า login ในหน้าอื่นแล้วเปลี่ยนหน้าโดยใช้ navbar
    [Setup]    Open web browser (maximize) and accept cookies   ${url_staging_punpro}    ${browser_chrome}
    Open login popup
    Click login with email
    Login as                             ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Click Element                        ${navbar_partner}
    Wait Until Location Is               ${url_staging_punpro_partner_login}
    Wait Until Element Is Visible        ${partner_term}

Case 004 Register - Link
    [Tags]    Partner
    [Documentation]    ตรวจสอบลิงก์ที่อยู๋ในหน้า ว่าสามารถไปยังจุดหมายที่ถูกต้องหรือไม่
    Login in partner page       ${username}   ${password}
    Scroll Element Into View    ${partner_link_ios}
    Click link (new tab)        ${partner_link_ios}        ${url_punpro_appStore_th}
    Switch Window               url=${url_staging_punpro_partner_login}
    Scroll Element Into View    ${partner_link_android}
    Click link (new tab)        ${partner_link_android}    ${url_punpro_googlePlay_th}

Case 005 Register - Back
    [Tags]    Partner
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ย้อนกลับ" ในหน้า register
    Login in partner page       ${username}   ${password}
    Scroll Element Into View    ${partner_back}
    Click Element               ${partner_back}
    Sleep    2s
    Wait Until Location Is      ${url_staging_punpro_partner_login}

Case 006 Register - Next - Unavailable
    [Tags]    Partner
    [Documentation]    ตรวจสอบการคลิกปุ่ม "ถัดไป" เมื่อไม่ได้กดยืนยันรับเงื่อนไข
    Login in partner page       ${username}   ${password}
    Scroll Element Into View    ${partner_next}
    Click Element               ${partner_next}
    Page Should Not Contain     ฟอร์มการสมัครปันโปร Partner สำหรับแจ้งโปรใกล้ฉัน และ คูปอง

Case 007 Register - Next - Available
    [Tags]    Partner
    [Documentation]    ตรวจสอบการคลิกปุ่ม "ถัดไป" เมื่อกดยืนยันรับเงื่อนไข
    Login in partner page       testpunpro@outlook.com    123456
    Go to form page

Case 008 Form - Next - Unavailable
    [Tags]    Partner
    [Documentation]    ตรวจสอบการคลิกปุ่ม "ถัดไป" เมื่อไม่ได้กดยืนยันรับเงื่อนไข
    Login in partner page       ${username}   ${password}
    Go to form page
    Scroll Element Into View    ${partner_next}
    Click Element               ${partner_next}

Case 009 Form - Not input require data
    [Tags]    Partner
    [Documentation]    ตรวจสอบการคลิกปุ่ม "ถัดไป" โดยไม่ใส่รายละเอียดต่างๆ
    Login in partner page       ${username}   ${password}
    Go to form page
    Scroll Element Into View             ${partner_next}
    Select Checkbox                      ${partner_accept_image}
    Click Element                        ${partner_next}
    Wait Until Element Is Visible        ${popup}
    Page Should Contain                  บันทึกข้อมูลไม่สำเร็จ
    Page Should Contain                  กรุณากรอกข้อมูลให้ครบ
    Click Element                        ${popup_ok}
    Wait Until Element Is Not Visible    ${popup}

