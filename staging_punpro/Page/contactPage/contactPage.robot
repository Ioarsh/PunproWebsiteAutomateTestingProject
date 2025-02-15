*** Settings ***
Library           SeleniumLibrary
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ./contactPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_contact}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 First Page
    [Tags]    Contact
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 002 Jobs link
    [Tags]    Contact
    [Documentation]    ตรวจสอบการทำงานของปุ่ม "ดูตำแหน่งงานที่รับสมัคร"
    Wait Until Element Is Visible    ${jobs}
    Click Element                    ${jobs}
    Wait Until Location Is           ${url_staging_punpro_jobs}

Case 03 Google Maps
    [Tags]    Contact
    [Documentation]    ตรวจสอบการทำงานของ google maps
    Wait Until Page Contains Element    ${punpro_map}
    Scroll Element Into View            ${punpro_map}
    Element Should Be Visible           ${punpro_map}
    Click Element                       ${punpro_map}
