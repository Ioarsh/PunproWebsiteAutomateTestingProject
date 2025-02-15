*** Settings ***
Library           SeleniumLibrary
Resource          ./topbar_keyword.robot
Resource          ../../default_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize)    ${url_staging_punpro}    ${browser_chrome}
Test Teardown     Close Browser


*** Test Cases ***

Case 001 Topbar - facebook
    [Tags]    Topbar
    [Documentation]    ตรวจสอบการทำงานของไอคอน facebook ในแถบด้านบนของเว็บไซต์
    Click link (new tab)    ${topbar_facebook}    ${url_punpro_facebook}

Case 002 Topbar - instagram
    [Tags]    Topbar
    [Documentation]    ตรวจสอบการทำงานของไอคอน instagram ในแถบด้านบนของเว็บไซต์
    Click link (new tab)    ${topbar_instagram}    ${url_punpro_instagram}

Case 003 Topbar - x
    [Tags]    Topbar
    [Documentation]    ตรวจสอบการทำงานของไอคอน x ในแถบด้านบนของเว็บไซต์
    Click link (new tab)    ${topbar_x}    ${url_punpro_x}

Case 004 Topbar - youtube
    [Tags]    Topbar
    [Documentation]    ตรวจสอบการทำงานของไอคอน youtube ในแถบด้านบนของเว็บไซต์
    Click link (new tab)    ${topbar_youtube}    ${url_punpro_youtube}

Case 006 Topbar - login
    [Tags]    Topbar
    [Documentation]    ตรวจสอบการทำงานเมื่อกด "เข้าสู่ระบบ หรือ สมัครสมาชิก" ในแถบด้านบนของเว็บไซต์
    Open login popup
