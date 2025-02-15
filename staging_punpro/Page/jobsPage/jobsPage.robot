*** Settings ***
Library           SeleniumLibrary
Library           ../../../utility.py
Resource          ../../Component/cookiesPopup/cookiesPopup_keyword.robot
Resource          ../../Component/loginPopup/loginPopup_keyword.robot
Resource          ../../Component/navbar/navbar_keyword.robot
Resource          ./jobsPage_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize) and accept cookies   ${url_staging_punpro_jobs}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 First Page
    [Tags]    Jobs
    [Documentation]    ตรวจสอบลิงก์ "หน้าแรก"
    Wait Until Element Is Visible     ${firstpage}
    Click Element                     ${firstpage}
    Wait Until Location Is            ${url_staging_punpro}
    Location Should Be                ${url_staging_punpro}

Case 002 Youtube player
    [Tags]    Jobs
    [Documentation]    ตรวจสอบการทำงานของ youtube player
    Wait Until Page Contains Element    ${youtube_player}
    Scroll Element Into View            ${youtube_player}
    Wait Until Element Is Visible       ${youtube_player}
    Select Frame                        ${youtube_player}
    Wait Until Element Is Visible       ${youtube_name}
    ${clip_url}=    Get Element Attribute    ${youtube_name}    href   
    Click link (new tab)                ${youtube_name}    ${clip_url}
    Switch Window                       url=${url_staging_punpro_jobs}
    Select Frame                        ${youtube_player}
    Wait Until Element Is Visible       ${youtube_play_button}
    Click Element                       ${youtube_play_button}
    Sleep    5s

Case 003 Card - link
    [Tags]    Jobs
    [Documentation]    ตรวจสอบการทำงานของ card (เฉพาะ card แรก)
    ${url}=    Get Element Attribute    ${firstcard}    href
    Click link (new tab)    ${firstcard}    ${url}
    
Case 004 Job Detail
    [Tags]    Jobs
    [Documentation]    ตรวจสอบการทำงานของ job detail ต่างๆ
    [Template]    Open Job Detail
    ${brand_marketing}                    ${brand_marketing_detail}       
    ${account_executive}                  ${account_executive_detail} 
    ${ba_research}                        ${ba_research_detail} 
    ${content_creator}                    ${content_creator_detail}
    ${content_creator_evgirls}            ${content_creator_evgirls_detail}
    ${content_manager}                    ${content_manager_detail}
    ${creative_producer}                  ${creative_producer_detail}
    ${content_writer_senior}              ${content_writer_senior_detail}
    ${content_writer_affiliate}           ${content_writer_affiliate_detail}
    ${graphic_designer}                   ${graphic_designer_detail}
    ${head_of_affiliate}                  ${head_of_affiliate_detail}
    ${head_of_data}                       ${head_of_data_detail}
    ${head_of_operation}                  ${head_of_operation_detail}
    ${internship_content_creator}         ${internship_content_creator_detail}
    ${internship_content_writer}          ${internship_content_writer_detail}
    ${internship_graphic_designer}        ${internship_graphic_designer_detail}
    ${internship_business_development}    ${internship_business_development_detail}
    ${internship_onsite_content}          ${internship_onsite_content_detail}
    ${internship_product_dev}             ${internship_product_dev_detail}
    ${internship_software_tester}         ${internship_software_tester_detail}
    ${internship_ux}                      ${internship_ux_detail}
    ${marketing_executive}                ${marketing_executive_detail}
    ${media_planner}                      ${media_planner_detail}
    ${seo_writer}                         ${seo_writer_detail}
    ${data_engineer}                      ${data_engineer_detail}
    ${product_manager}                    ${product_manager_detail}
    ${android_dev}                        ${android_dev_detail}
    ${backend_dev}                        ${backend_dev_detail}
    ${ios_dev}                            ${ios_dev_detail}
    ${sustain_product_manager}            ${sustain_product_manager_detail}
    ${ux_ui}                              ${ux_ui_detail}


