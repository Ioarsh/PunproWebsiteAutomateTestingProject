*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ./mainpage_keyword.robot
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro}    ${browser_chrome}
Test Teardown     Close Browser


*** Test Cases ***
Case 001 Popup - link
    [Tags]    Popup
    [Documentation]    ตรวจสอบการทำงานของ Popup เมื่อกดตรง Popup
    Click Pop up
    Switch Window                    แอปพลิเคชันปันโปร ดาวน์โหลดได้แล้ววันนี้ | ปันโปร - Punpromotion
    Location Should Be               ${popup_url}

Case 002 Popup - close
    [Tags]    Popup
    [Documentation]    ตรวจสอบการทำงานของปุ่มปิด Popup     
    Close Pop Up

Case 003 Popup - wait
    [Tags]    Popup
    [Documentation]    ตรวจสอบการทำงานของ Popup เมื่อรอให้ Popup ปิดเองเป็นเวลา 20 วินาที
    Check Pop Up In
    Sleep    20s
    Check Pop Up Out

Case 004 Scrolling
    [Tags]    MainPage
    [Documentation]    ตรวจสอบการเลื่อนของหน้าเว็บ
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    sleep    3s
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)

Case 005 Highlight - static highlight - link
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการทำงานของลิงค์โพสใน highlight ที่อยู่กับที่
    [Template]    Check card link (class)
    ${highlight_first}
    ${highlight_second}

Case 006 Highlight - slider highlight
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการทำงานของ highlight slider
    Check highlight slider    ${highlight_slider_active}    ${highlight_slider_prev}    -300
    Check highlight slider    ${highlight_slider_active}    ${highlight_slider_next}    300

Case 007 Highlight - slider highlight - auto
    [Tags]    Highlight
    [Documentation]    ตรวจสอบการเลื่อนของ highlight slider โดยอัติโนมัติ
    Wait Until Element Is Visible    ${highlight_slider_active}
    ${init_index} =    Get Element Attribute    ${highlight_slider_active}    data-swiper-slide-index
    Sleep    3s
    Wait Until Page Contains Element    ${highlight_slider_active}
    ${new_index} =    Get Element Attribute    ${highlight_slider_active}   data-swiper-slide-index
    Should Not Be Equal    ${init_index}    ${new_index}

Case 008 Highlight - slider highlight - link
    [Tags]    Highlight
    [Documentation]    ตรวจสอบลิงค์ของโพสต์ที่อยู่ใน slider
    Wait Until Element Is Visible    ${highlight_slider_active}
    ${link} =    Get Element Attribute    ${highlight_slider_active}//div//a    href
    Click Element                    ${highlight_slider_active}
    Wait Until Location Contains     ${link}
    Location Should Be               ${link}

Case 009 Category - show
    [Tags]    Category
    [Documentation]    ตรวจสอบการทำงานของปุ่มสินค้าและแบรนด์
    Check category button    ${category_brands}
    Check category button    ${category_products}

Case 010 Category - see all
    [Tags]    Category
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ดูทั้งหมด"
    [Template]    Check category see all
    ${category_brands}
    ${category_products}

Case 011 Category - scrolling
    [Tags]    Category
    [Documentation]    ตรวจสอบการทำงานของ slider ของ categoty
    Wait Until Page Contains Element    ${category_slider}
    Scroll Element Into View            ${category_slider}
    Drag And Drop By Offset             ${category_slider}    -270    0
    Drag And Drop By Offset             ${category_slider}    270       0

Case 012 Category - link - product
    [Tags]    Category
    [Documentation]    ตรวจสอบการทำงานของ slider ของ categoty
    [Template]    Test Scenario - Category link - product
    ${category_product_shoe}
    ${category_product_bag}
    ${category_product_shirt}
    ${category_product_beauty}
    ${category_product_it}
    ${category_product_pant}
    ${category_product_skincare}
    ${category_product_sandal}
    ${category_product_hat}
    
Case 013 Category - link - brand
    [Tags]    Category
    [Documentation]    ตรวจสอบการทำงานของ slider ของ brand
    [Template]    Test Scenario - Category link - brand
    ${category_brand_adidas}        
    ${category_brand_nike}          
    ${category_brand_lyn}           
    ${category_brand_fila}          
    ${category_brand_charles}       
    ${category_brand_uniqlo}        
    ${category_brand_converse}      
    ${category_brand_guess}         
    ${category_brand_calvin}        
    ${category_brand_starbuck}      

Case 014 Services - link
    [Tags]    Category
    [Documentation]    ตรวจสอบการทำงานของลิงก์แต่ละลิงก์ในแถบ "บริการทั้งหมด"
    [Template]    Test Scenario - Services link
    ${services_shopper_posts}       ${url_staging_punpro_shoppper_posts}
    ${services_promotion_online}    ${url_staging_punpro_promotion_online}
    ${services_coupons}             ${url_staging_punpro_coupons}
    ${services_article}             ${url_staging_punpro_article}
    ${services_promotion}           ${url_staging_punpro_promotion}

Case 015 Recommend Article - see all
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ดูทั้งหมด" 
    Scroll Element Into View         ${rec_article_seeall}
    Wait Until Element Is Visible    ${rec_article_seeall}
    Click Element                    ${rec_article_seeall}
    Wait Until Location Is           ${url_staging_punpro_article}
    Location Should Be               ${url_staging_punpro_article}

Case 016 Recommend Article - static card- link - pic
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกรูปใน card Recommend Article ที่อยู่กับที่
    Check card link (class)    ${rec_article_first_pic}

Case 017 Recommend Article - static card - link - text
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ Recommend Article ที่อยู่กับที่
    Check card link (class)    ${rec_article_first_text}

Case 018 Recommend Article - static card - like - not login
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ Recommend Article ที่อยู่กับที่
    Click Login Needed    ${rec_article_first_like}

Case 019 Recommend Article - static card - like - login
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ Recommend Article ที่อยู่กับที่
    Close Pop Up
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Close Pop Up
    Check card like number    ${rec_article_first_like}    ${rec_article_first_like_count}

Case 020 Recommend Article - slider
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการทำงานของ slider Recommend Article
    Scroll Element Into View         ${rec_article_slider}
    Wait Until Element Is Visible    ${rec_article_slider}
    Drag And Drop By Offset          ${rec_article_slider}    -200    0
    Drag And Drop By Offset          ${rec_article_slider}    200    0

Case 021 Recommend Article - slider - card - link - pic
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ Recommend Article ที่อยู่ใน slider
    Check card link (class)    ${rec_article_slider_active_pic}

Case 022 Recommend Article - slider - card - link - text
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ Recommend Article ที่อยู่ใน slider
    Check card link (class)    ${rec_article_slider_active_text}

Case 023 Recommend Article - slider - card - like - not login
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ Recommend Article ที่อยู่ใน slider
    Click Login Needed    ${rec_article_slider_active_like}

Case 024 Recommend Article - slider - card - like - login
    [Tags]    Recommend Article
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ Recommend Article ที่อยู่ใน slider
    Close Pop Up
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Close Pop Up
    Check card like number    ${rec_article_slider_active_like}    ${rec_article_slider_active_like_count}

Case 025 Shopper Posts - see all
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ดูทั้งหมด"
    Wait Until Page Contains Element    ${shopper_posts_seeall}
    Scroll Element Into View            ${shopper_posts_seeall}
    Wait Until Element Is Visible       ${shopper_posts_seeall}
    Click Element                       ${shopper_posts_seeall}
    Wait Until Location Is              ${url_staging_punpro_shoppper_posts}
    Location Should Be                  ${url_staging_punpro_shoppper_posts}

Case 026 Shopper Post - scroll
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการทำงานของ slider Shopper Posts
    Wait Until Page Contains Element    ${shopper_posts_slider}
    Scroll Element Into View            ${shopper_posts_slider}
    Wait Until Element Is Visible       ${shopper_posts_slider}
    Drag And Drop By Offset             ${shopper_posts_slider}    -100    0
    Drag And Drop By Offset             ${shopper_posts_slider}    100   0

Case 027 Shopper Post - card - link - pic
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ Shopper Posts
    Check card link (class)    ${shopper_posts_first_pic}

Case 028 Shopper Post - card - link - text
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ Shopper Posts
    Check card link (class)   ${shopper_posts_first_text}

Case 029 Shopper Post - card - like - not login
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ Shopper Posts
    Click Login Needed     ${shopper_posts_first_like}

Case 030 Shopper Post - card - like - login
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ Shopper Posts
    Close Pop Up
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Close Pop Up
    Check card like number    ${shopper_posts_first_like}    ${shopper_posts_first_like_count}

Case 031 Affiliate - tab
    [Tags]    Affiliate
    [Documentation]    ตรวจสอบปุ่มเปลี่ยน tab ต่างๆของ "ปันโปรแนะนำ"
    [Template]    Test Scenario - Affiliate tab
    ${affiliate_shopper_posts}       รับหิ้ว
    ${affiliate_promotion_online}    โปรออนไลน์
    ${affiliate_recommend}           โปรแนะนำ
    ${affiliate_article}             บทความ
    ${affiliate_all}                 ทั้งหมด

Case 032 Affiliate - card - link - pic
    [Tags]    Affiliate
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ Affiliate
    Check card link (xpath)    ${affiliate_card_firstcard_pic}

Case 033 Affiliate - card - link - text
    [Tags]    Affiliate
    [Documentation]    ตรวจสอบการคลิกชื่อใน card ของ Affiliate
    Check card link (xpath)   ${affiliate_card_firstcard_text}

Case 034 Affiliate - card - like - not login
    [Tags]    Affiliate
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ยังไม่ได้ login ของ Affiliate
    Click Login Needed   ${affiliate_card_firstcard_like}

Case 035 Affiliate - card - like - login
    [Tags]    Affiliate
    [Documentation]    ตรวจสอบการคลิกถูกใจในขณะที่ login ของ Affiliate
    Close Pop Up
    Open login popup
    Click login with email
    Login as    ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_popup_modal}
    Close Pop Up
    Check card like number    ${affiliate_card_firstcard_like}    ${affiliate_card_firstcard_like_count}

Case 036 Affiliate - loading
    [Tags]    Affiliate
    [Documentation]    ตรวจสอบการโหลด card เพิ่มเมื่อ scroll ไปสิ้นสุด
    Wait Until Page Contains Element    ${affiliate_card_container}
    Scroll Element Into View    ${affiliate_card_container}
    ${style}=    Get Element Attribute    ${affiliate_card_container_height}    style
    ${first_height} =    get_style_height_px    ${style}
    Execute JavaScript    window.scrollBy(0, 2000)
    ${style}=    Get Element Attribute    ${affiliate_card_container_height}    style
    ${current_height} =    get_style_height_px    ${style}
    Should Be True    ${current_height} > ${first_height}
    
    
    