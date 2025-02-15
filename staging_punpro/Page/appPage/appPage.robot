*** Settings ***
Library           SeleniumLibrary
Resource          ./appPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open App Page
Test Teardown     Close Browser

*** Test Cases ***
Case 001 back
    [Tags]     App
    [Documentation]    ตรวจสอบการทำงานของปุ่มกลับเพื่อกลับไปหน้าหลัก
    Click link (same tab)    ${app_back}    ${url_staging_punpro}
    
Case 002 AppStore
    [Tags]     App
    [Documentation]    ตรวจสอบสอบการทำงานของปุ่มเปิด appstore
    Click link (new tab)    ${app_appStore}    ${url_punpro_appStore}

Case 003 GooglePlay
    [Tags]     App
    [Documentation]    ตรวจสอบสอบการทำงานของปุ่มเปิด google play
    Click link (new tab)    ${app_googlePlay}    ${url_punpro_googlePlay}