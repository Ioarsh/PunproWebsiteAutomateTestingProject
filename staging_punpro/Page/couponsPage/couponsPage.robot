*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./couponsPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_coupons}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 First Page
    [Tags]    Coupons
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 002 Page Navigation - All coupons
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่มแท็บ "รวมคูปอง"
    Wait Until Element Is Visible    ${coupons_all}
    Wait Until Element Is Visible    ${coupons_me}
    Click Element                    ${coupons_me}
    Wait Until Element Is Visible    ${coupons_me_login}
    Click Element                    ${coupons_all}
    Wait Until Element Is Visible    ${coupons_list}

Case 003 Page Navigation - My coupons - not login
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่มแท็บ "คูปองของฉัน" เมื่อไม่ได้ล็อกอิน
    Wait Until Element Is Visible    ${coupons_me}
    Click Element                    ${coupons_me}
    Wait Until Element Is Visible    ${coupons_me_login}

Case 004 Page Navigation - My coupons - login - empty
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่มแท็บ "คูปองของฉัน" เมื่อล็อกอิน แต่ไม่ได้เก็บคูปอง
    Wait Until Element Is Visible        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_me_login}
    Click Element                        ${coupons_me_login}
    Wait Until Element Is Visible        ${login_popup_modal}
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Wait Until Element Is Visible        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Page Contains    ไม่มีข้อมูล

Case 005 Page Navigation - My coupons - login - not empty
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่มแท็บ "คูปองของฉัน" เมื่อล็อกอิน และมีคูปอง
    Wait Until Element Is Visible        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_me_login}
    Click Element                        ${coupons_me_login}
    Wait Until Element Is Visible        ${login_popup_modal}
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Wait Until Element Is Visible        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_me_list}
    Page Should Not Contain    ไม่มีข้อมูล

Case 006 Collect - post
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "กดรับคูปอง"
    Click first coupons post

Case 007 Collect - not login
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "รับคูปอง" ในคูปอง เมื่อไม่ได้ login
    Click first coupons post
    Scroll Element Into View         ${coupons_post_collect}
    Click Element                    ${coupons_post_collect}
    Wait Until Element Is Visible    ${login_popup_modal}

Case 008 Collect - login
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "รับคูปอง" ในคูปอง เมื่อได้ login
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Click first coupons post
    ${name}=    Get Text    ${coupons_post_name}
    Scroll Element Into View         ${coupons_post_collect}
    Click Element                    ${coupons_post_collect}
    Wait Until Location Is           ${url_staging_punpro_my_coupons}
    Page Should Contain    ${name}

Case 009 Collect - already out
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "รับคูปอง" ในคูปอง กรณีไม่สามารถรับสิทธิ์ได้
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Click coupons button (xpath)         ${coupons_one}
    Page Should Contain    คุณได้รับสิทธิ์ครบแล้ว
    Scroll Element Into View             ${coupons_post_quota}
    ${text}=    Get Text    ${coupons_post_quota}
    ${quota}=    get_quota_num    ${text}
    Scroll Element Into View         ${coupons_post_collect}
    Click Element                    ${coupons_post_collect}
    Wait Until Element Is Visible    ${coupons_post_popup_out}
    ${failed}=    Get Text    ${coupons_post_popup_out_text}
    Should Be Equal As Strings    ${failed}    สามารถรับสิทธิ์ได้ ${quota} สิทธิ์ต่อคน รับไปแล้ว ${quota} สิทธิ์

Case 010 Collect - less than one
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการกดเลือกจำนวนคูปองที่จะรับ กรณีน้อยกว่า 1
    Click first coupons post
    Scroll Element Into View         ${coupons_post_count}
    Wait Until Element Is Visible    ${coupons_post_count}
    Wait Until Element Is Visible    ${coupons_post_minus}
    Click Element                    ${coupons_post_minus}
    ${count}=    Get Text    ${coupons_post_count}
    Should Be Equal As Integers    ${count}    1

Case 011 Collect - more than one
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการกดเลือกจำนวนคูปองที่จะรับ กรณีมากกว่า 1
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Wait Until Element Is Visible        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_first_collect}
    Click Element                        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_me_list}
    ${child}=    Get WebElements    ${coupons_me_list}/div
    ${number} =    Get Length    ${child}
    Wait Until Element Is Visible        ${coupons_all}
    Click Element                        ${coupons_all}
    Click first coupons post
    Scroll Element Into View         ${coupons_post_count}
    Wait Until Element Is Visible    ${coupons_post_count}
    Wait Until Element Is Visible    ${coupons_post_plus}
    Click Element                    ${coupons_post_plus}
    ${count}=    Get Text    ${coupons_post_count}
    ${expected}=    Evaluate    ${number}+${count}
    Scroll Element Into View         ${coupons_post_collect}
    Wait Until Element Is Visible    ${coupons_post_collect}
    Click Element                    ${coupons_post_collect}
    Wait Until Location Is           ${url_staging_punpro_my_coupons}
    Wait Until Element Is Visible        ${my_coupons_list}
    ${child}=    Get WebElements    ${my_coupons_list}/div
    ${new_number} =    Get Length    ${child}
    Should Be Equal As Integers      ${new_number}    ${expected}

Case 011 Collect - more than limit
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการกดเลือกจำนวนคูปองที่จะรับ กรณีมากกว่าจำนวนสิทธิ์
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Click coupons button (xpath)         ${coupons_many}
    Scroll Element Into View         ${coupons_post_count}
    Wait Until Element Is Visible    ${coupons_post_count}
    Wait Until Element Is Visible    ${coupons_post_plus}
    ${text}=    Get Text    ${coupons_post_quota}
    ${quota}=    get_quota_num    ${text}
    ${upper_limit}=    Evaluate    ${quota}+1
    FOR  ${i}  IN RANGE    1    ${upper_limit}    1
        Click Element    ${coupons_post_plus}
    END
    ${count}=    Get Text    ${coupons_post_count}
    Should Be True    ${count} <= ${quota}

Case 012 Use Coupon - cancel
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการใช้งานคูปอง กรณียกเลิกการใช้
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Wait Until Element Is Visible        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_me_first_use}
    Click Element                        ${coupons_me_first_use}
    Wait Until Element Is Visible        ${coupons_me_detail}
    Wait Until Element Is Visible        ${coupons_me_using}
    Click Element                        ${coupons_me_using}
    Wait Until Element Is Visible        ${coupons_me_using_popup}
    Wait Until Element Is Visible        ${coupons_me_using_cancel}
    Click Element                        ${coupons_me_using_cancel}
    Wait Until Element Is Not Visible    ${coupons_me_using_popup}
    Element Should Be Visible            ${coupons_me_detail}
    Element Should Not Be Visible        ${coupons_me_using_popup}

Case 013 Use Coupon - accept - barcode/tab
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการใช้งานคูปอง กรณียืนยันการใช้
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Wait Until Element Is Visible        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Element Is Visible        ${coupons_me_first_use}
    Click Element                        ${coupons_me_first_use}
    Wait Until Element Is Visible        ${coupons_me_detail}
    Wait Until Element Is Visible        ${coupons_me_using}
    Click Element                        ${coupons_me_using}
    Wait Until Element Is Visible        ${coupons_me_using_popup}
    Wait Until Element Is Visible        ${coupons_me_using_confirm}
    Click Element                        ${coupons_me_using_confirm}
    Wait Until Page Contains Element     ${coupons_me_using_qrcode}
    Scroll Element Into View             ${coupons_me_using_qrcode}
    Click Element                        ${coupons_me_using_tab_barcode}
    Wait Until Element Is Visible        ${coupons_me_using_barcode}
    Click Element                        ${coupons_me_using_tab_qrcode}
    Wait Until Element Is Visible        ${coupons_me_using_qrcode}
    Click Element                        ${coupons_me_using_close}
    Wait Until Element Is Not Visible    ${coupons_me_using_popup}

Case 014 Use Coupon - accept - unavailable
    [Tags]    Coupons
    [Documentation]    ตรวจสอบการแสดงผลของคูปอง หลังใช้งานคูปอง (ต้องคูปองที่ชื่อไม่ซ้ำในการทดสอบ)
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    #เปลี่ยน locator ของคูปองตรงนี้
    ##########################################
    ${selected_coupons}=    Set Variable    xpath=//*[@id="รวมคูปอง"]/div/div/div[2]/div/div[5]/div
    ##########################################
    Click coupons button (xpath)         ${selected_coupons}
    ${name}=    Get Text    ${coupons_post_name}
    Scroll Element Into View             ${coupons_post_collect}
    Click Element                        ${coupons_post_collect}
    Wait Until Location Is               ${url_staging_punpro_my_coupons}
    Page Should Contain                  ${name}
    Sleep    3s
    Wait Until Element Is Visible        ${navbar_coupons}
    Click Element                        ${navbar_coupons}
    Wait Until Element Is Visible        ${coupons_me}
    Wait Until Element Is Enabled        ${coupons_me}
    Click Element                        ${coupons_me}
    Wait Until Page Contains Element     locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Scroll Element Into View             locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Wait Until Element Is Visible        locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Click Element                        locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Wait Until Element Is Visible        ${coupons_me_detail}
    Wait Until Element Is Visible        ${coupons_me_using}
    Click Element                        ${coupons_me_using}
    Wait Until Element Is Visible        ${coupons_me_using_popup}
    Wait Until Element Is Visible        ${coupons_me_using_confirm}
    Click Element                        ${coupons_me_using_confirm}
    Wait Until Element Is Visible        ${coupons_me_using_close}
    Click Element                        ${coupons_me_using_close}
    Wait Until Element Is Not Visible    ${coupons_me_using_popup}
    Wait Until Page Contains Element     locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Wait Until Element Is Visible        locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Scroll Element Into View             locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Wait Until Element Is Visible        locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    ${text}=    Get Text    locator=xpath=//*[contains(text(), '${name}')]/parent::*/following-sibling::*/following-sibling::*/button
    Should Be Equal As Strings    ${text}    ใช้ไปแล้ว
    


    