*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./shopperPosts_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_shoppper_posts}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 First Page
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 002 ShoppperPosts - card - link - pic
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการคลิกรูปใน card ของ "ปันโปรรับหิ้ว"
    Check card link (class)    ${firstcard_pic}

Case 003 ShoppperPosts - card - link - text
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบการคลิกข้อความใน card ของ "ปันโปรรับหิ้ว"
    Check card link (class)    ${firstcard_text}

Case 004 ShoppperPosts - card - hover
    [Tags]    Article
    [Documentation]    ตรวจสอบ card เมื่อนำเมาส์ไปวาง
    Scroll Element Into View         ${firstcard_pic}
    Wait Until Element Is Visible    ${firstcard_pic}
    Mouse Over                       ${firstcard_pic}
    Wait Until Element Is Visible    ${firstcard_share}

Case 005 ShoppperPosts - card - share
    [Tags]    Shopper Posts
    [Documentation]    ตรวจสอบปุ่ม share ของ card
    Scroll Element Into View         ${firstcard_share}
    Wait Until Element Is Visible    ${firstcard_share}
    Click Element                    ${firstcard_share}
    Element Should Be Visible        ${firstcard_facebook}
    Element Should Be Visible        ${firstcard_x}
    Element Should Be Visible        ${firstcard_line}

    