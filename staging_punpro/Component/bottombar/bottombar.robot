*** Settings ***
Library           SeleniumLibrary
Resource          ./bottombar_keyword.robot
Resource          ../../default_keyword.robot
Resource          ../loginPopup/loginPopup_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize)    ${url_staging_punpro_contact}    ${browser_chrome}
Test Teardown     Close Browser


*** Test Cases ***

Case 001 Bottombar - PromotionPage
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรโมชั่น"
    Click link (same tab)    ${bottombar_promotion}    ${url_staging_punpro_promotion}

Case 002 Bottombar - ArticlePage
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "บทความ"
    Click link (same tab)    ${bottombar_article}    ${url_staging_punpro_article}

Case 003 Bottombar - ShopperPostsPage
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ปันโปรรับหิ้ว"
    Click link (same tab)    ${bottombar_shopper_posts}    ${url_staging_punpro_shoppper_posts}

Case 004 Bottombar - PromotionOnlinePage
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรออนไลน์"
    Click link (same tab)    ${bottombar_promotion_online}    ${url_staging_punpro_promotion_online}

Case 006 Bottombar - PartnerPage - not login
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "พาร์ทเนอร์" เมื่อไม่ได้ login
    Click link (same tab)    ${bottombar_partner}    ${url_staging_punpro_partner_notlogin}

Case 007 Bottombar- PartnerPage - login
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "พาร์ทเนอร์" เมื่อ login
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Click link (same tab)    ${bottombar_partner}    ${url_staging_punpro_partner_login}

Case 008 Bottombar - CouponPage
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "คูปอง"
    Click link (same tab)    ${bottombar_coupons}    ${url_staging_punpro_coupons}

Case 009 Bottombar - ContactPage
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ติดต่อเรา"
    Click link (same tab)    ${bottombar_contact}    ${url_staging_punpro_contact}

Case 010 Bottombar - Facebook
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "Facebook"
    Click link (new tab)    ${bottombar_facebook}    ${url_punpro_facebook}

Case 011 Bottombar - Instagram
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "Instagram"
    Click link (new tab)    ${bottombar_instagram}    ${url_punpro_instagram}

Case 012 Bottombar - X
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "X"
    Click link (new tab)    ${bottombar_x}    ${url_punpro_x}

Case 013 Bottombar - Youtube
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "Youtube"
    Click link (new tab)    ${bottombar_youtube}    ${url_punpro_youtube}

Case 014 Bottombar - Promotion - 1get1
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปร 1 แถม 1"
    Click link (new tab)    ${bottombar_1get1}    ${url_staging_punpro_promotion}?categories=buy1-get1-free

Case 015 Bottombar - Promotion - 50
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "50% up"
    Click link (new tab)    ${bottombar_50}    ${url_staging_punpro_promotion}?categories=sale-50p-up

Case 016 Bottombar - Promotion - phone
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรมือถือ"
    Click link (new tab)    ${bottombar_phone}    ${url_staging_punpro_promotion}?categories=mobile-phone

Case 017 Bottombar - Promotion - food
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรอาหาร"
    Click link (new tab)    ${bottombar_food}    ${url_staging_punpro_promotion}?categories=food

Case 018 Bottombar - Promotion - ticket
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรตั๋วถูก"
    Click link (new tab)    ${bottombar_ticket}    ${url_staging_punpro_promotion}?categories=ticket

Case 019 Bottombar - Promotion - code
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โค้ดส่วนลด"
    Click link (new tab)    ${bottombar_code}    ${url_staging_punpro_promotion}?categories=discount

Case 020 Bottombar - Article - fashion
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรสายแฟ"
    Click link (new tab)    ${bottombar_fashion}    ${url_staging_punpro_article}?categories=pro-fashion

Case 021 Bottombar - Article - eat
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรกิน"
    Click link (new tab)    ${bottombar_eat}    ${url_staging_punpro_article}?categories=pro-eat

Case 022 Bottombar - Article - eat
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรเที่ยว"
    Click link (new tab)    ${bottombar_travel}    ${url_staging_punpro_article}?categories=pro-travel

Case 023 Bottombar - Article - smart
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรเที่ยว"
    Click link (new tab)    ${bottombar_smart}    ${url_staging_punpro_article}?categories=pro-smart

Case 024 Bottombar - Article - update
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรอัพเดท"
    Click link (new tab)    ${bottombar_update}    ${url_staging_punpro_article}?categories=pro-update

Case 025 Bottombar - Article - talking
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "โปรชวนคุย"
    Click link (new tab)    ${bottombar_talking}    ${url_staging_punpro_article}?categories=pro-talking

Case 026 Bottombar - app store
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "App store"
    Click link (new tab)    ${bottombar_appstore}    ${url_punpro_appStore_th}   

Case 027 Bottombar - google play
    [Tags]    Bottombar
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "Google Play"
    Click link (new tab)    ${bottombar_playstore}    ${url_punpro_googlePlay_th}  