*** Settings ***
Library           SeleniumLibrary
Resource          ./navbar_keyword.robot
Resource          ../topbar/topbar_keyword.robot
Resource          ../loginPopup/loginPopup_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize)    ${url_staging_punpro}    ${browser_chrome}
Test Teardown     Close Browser


*** Test Cases ***
Case 001 Navbar - MainPage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ปันโปร"
    Click link (same tab)    ${navbar_main}    ${url_staging_punpro}

Case 002 Navbar - PromotionPage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรโมชั่น"
    Click link (same tab)    ${navbar_promotion}    ${url_staging_punpro_promotion}

Case 003 Navbar - ArticlePage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "บทความ"
    Click link (same tab)    ${navbar_article}    ${url_staging_punpro_article}

Case 004 Navbar - ShopperPostsPage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ปันโปรรับหิ้ว"
    Click link (same tab)    ${navbar_shopper_posts}    ${url_staging_punpro_shoppper_posts}

Case 005 Navbar - PromotionOnlinePage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรออนไลน์"
    Click link (same tab)    ${navbar_promotion_online}    ${url_staging_punpro_promotion_online}

Case 006 Navbar - PartnerPage - not login
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "พาร์ทเนอร์" เมื่อไม่ได้ login
    Click link (same tab)    ${navbar_partner}    ${url_staging_punpro_partner_notlogin}

Case 007 Navbar - PartnerPage - login
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "พาร์ทเนอร์" เมื่อ login
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Click link (same tab)    ${navbar_partner}    ${url_staging_punpro_partner_login}

Case 008 Navbar - CouponPage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "คูปอง"
    Click link (same tab)    ${navbar_coupons}    ${url_staging_punpro_coupons}

Case 009 Navbar - ContactPage
    [Tags]    Navbar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ติดต่อเรา"
    Click link (same tab)    ${navbar_contact}    ${url_staging_punpro_contact}

Case 010 Navbar - Search
    [Tags]    Navebar
    [Documentation]    ตรวจสอบการทำงานของช่อง search
    [Template]    Test Scenario - Search in navbar
    123
    abc
    I want you
    สวัสดี
    !@# ไว้ก่อน


