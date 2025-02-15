*** Settings ***
Library           SeleniumLibrary
Resource          ./loginPopup_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Test Setup        Open login popup on mainpage
Suite Teardown    Close All Browsers
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Login - close
    [Tags]    Login
    [Documentation]    ตรวจสอบการปิด popup ของหน้าล็อกอินเมื่อกดปุ่มกากบาท
    Close login popup
    Element Should Not Be Visible    ${login_popup_modal}

Case 002 Login - email button
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "เข้าสู่ระบบด้วยอีเมล"
    Click login with email
    Element Should Be Visible    ${login_email_emailField}       
    Element Should Be Visible    ${login_email_passwordField}    
    Element Should Be Visible    ${login_email_forgot}           
    Element Should Be Visible    ${login_email_cancel}           
    Element Should Be Visible    ${login_email_enter}            
    Element Should Be Visible    ${login_email_close}

Case 003 Login - google
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "เข้าสู่ระบบด้วย google"
    Click Element    ${login_google}

Case 004 Login - facebook
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "เข้าสู่ระบบด้วย facebook"
    Click Element    ${login_facebook}

Case 005 Login - email - cancel
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำการของปุ่ม "ยกเลิก" เมื่อทำการเข้าสู่ระบบด้วยอีเมล
    Click login with email
    Click cancel     
    Element Should Be Visible    ${login_google}    
    Element Should Be Visible    ${login_email}           
    Element Should Be Visible    ${login_facebook}           
    Element Should Be Visible    ${login_register}
    Element Should Be Visible    ${login_close}

Case 006 Login - email - success
    [Tags]    Login
    [Documentation]    ตรวจสอบการ Login ด้วยอีเมลสำเร็จ
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Page Contains    เข้าสู่ระบบสำเร็จ
    Wait Until Element Is Visible    ${topbar_username}
    Element Should Not Be Visible    ${topbar_login}

Case 007 Login - email - fail - no user
    [Tags]    Login
    [Documentation]    ตรวจสอบการ Login ล้มเหลวเนื่องจากไม่มีบัญชีในระบบ
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Page Contains    There is no user record corresponding to this identifier. The user may have been deleted.

Case 008 Login - email - fail - wrong password
    [Tags]    Login
    [Documentation]    ตรวจสอบการ Login ล้มเหลวเนื่องจากกรอกรหัสผิด
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Page Contains    The password is invalid or the user does not have a password.

Case 009 Login - email - fail - wrong email format
    [Tags]    Login
    [Documentation]    ตรวจสอบการ Login ล้มเหลวเนื่องอีเมลไม่ตรงตามรูปแบบที่กำหนด
    [Setup]    Open login popup on mainpage and login in with email
    [Template]    Login Fail - Wrong email format
    testgmail.com    123456
    ABCDEFG          123456
    test@            123456

Case 010 Login - email - fail - too much attempt
    [Tags]    Login
    [Documentation]    ตรวจสอบการ Login ล้มเหลวและใส่รหัสผิดมากเกินไป
    [Setup]    Open login popup on mainpage and login in with email
    FOR    ${no}    IN    one    two    three    four    five    six 
        Login as    ${username}   ${password}
        Wait Until Element Is Visible    ${login_fail_close}
        Click Element    ${login_fail_close}
    END
    Wait Until Page Contains    Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.

Case 011 Login - email - forgot
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ลืมรหัสผ่าน"
    Click login with email
    Click forgot password
    Element Should Be Visible    ${login_email_forgot_emailField}             
    Element Should Be Visible    ${login_email_forgot_cancel}           
    Element Should Be Visible    ${login_email_forgot_close}    
    Element Should Be Visible    ${login_email_forgot_send}                   

Case 012 Login - email - forgot - cancel
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ยกเลิก" ของหน้า "ลืมรหัสผ่าน"
    Click login with email
    Click forgot password
    Wait Until Element Is Visible    ${login_email_forgot_cancel}
    Click Element                    ${login_email_forgot_cancel}
    Wait Until Element Is Visible    ${login_email_forgot}
    Element Should Be Visible        ${login_email_emailField}       
    Element Should Be Visible        ${login_email_passwordField}    
    Element Should Be Visible        ${login_email_forgot}           
    Element Should Be Visible        ${login_email_cancel}           
    Element Should Be Visible        ${login_email_enter}            
    Element Should Be Visible        ${login_email_close}

Case 013 Login - register
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "สมัครสมาชิก"
    Click register
    Wait Until Element Is Visible    ${register_cancel}
    Element Should Be Visible    ${register_emailField}       
    Element Should Be Visible    ${register_passwordField}    
    Element Should Be Visible    ${register_confirm_passwordField}           
    Element Should Be Visible    ${register_cancel}           
    Element Should Be Visible    ${register_register}            
    Element Should Be Visible    ${register_close}

Case 014 Login - register - cancel
    [Tags]    Login
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "สมัครสมาชิก"
    Click register
    Wait Until Element Is Visible    ${register_cancel}
    Click Element                    ${register_cancel}
    Wait Until Element Is Visible    ${login_google} 
    Element Should Be Visible        ${login_google}    
    Element Should Be Visible        ${login_email}           
    Element Should Be Visible        ${login_facebook}           
    Element Should Be Visible        ${login_register}
    Element Should Be Visible        ${login_close}   