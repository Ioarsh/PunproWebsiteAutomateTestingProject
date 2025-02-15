*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./mainPage_variable.robot
Resource   ../../default_keyword.robot

*** Keywords ***
######### Popup #########
Click Pop up
    [Tags]    Popup
    Wait Until Element Is Visible    ${popup_image} 
    Click Element                    ${popup_image}
    Sleep                            5s

Close Pop Up
    [Tags]    Popup
    Wait Until Element Is Visible    ${popup_animation}
    Wait Until Element Is Visible    ${popup_close_button}
    Click Element                    ${popup_close_button}
    Check Pop Up Out

Check Pop Up In
    [Tags]    Popup
    Wait Until Element Is Visible    ${popup_animation}
    ${class}=    Get Element Attribute    ${popup_animation}    class
    Should Contain    ${class}    ${popup_animation_in}

Check Pop Up Out
    [Tags]    Popup
    ${class}=    Get Element Attribute    ${popup_animation}    class
    Should Contain    ${class}    ${popup_animation_out}

######### Highlight #########
Check highlight slider
    [Tags]    Highlight
    [Arguments]    ${current}    ${new}    ${direction}
    Wait Until Element Is Visible    ${current}
    ${init_index} =    Get Element Attribute    ${current}    data-swiper-slide-index
    Drag And Drop By Offset    ${current}    ${direction}    0
    Sleep    1s
    Wait Until Page Contains Element    ${new}
    ${new_index} =    Get Element Attribute    ${new}   data-swiper-slide-index
    Should Be Equal    ${init_index}    ${new_index}

######### Category #########
Check category button
    [Tags]    Category
    [Arguments]    ${type}
    Wait Until Element Is Visible    ${type}
    Scroll Element Into View         ${type}
    Click Element                    ${type}
    ${current_class}=    Get Element Attribute    ${type}    class
    ${current_class}=    Get First Class Part     ${current_class}
    Should Be Equal    ${current_class}    ${category_active}

Check category see all
    [Tags]    Categoty
    [Arguments]    ${type}
    Wait Until Element Is Visible    ${type}
    Scroll Element Into View         ${type}
    Click Element                    ${type}
    Click Element                    ${category_see_all}
    ${type}=    get_last_id_part    ${type}
    Wait Until Location Is    ${url_staging_punpro_category_groups}/${type}
    Location Should Be        ${url_staging_punpro_category_groups}/${type}
    Go Back

Test Scenario - Category link - product
    [Tags]    Category
    [Arguments]    ${icon}
    Scroll Element Into View    ${category_container}
    Sleep    0.5s
    ${is_visible}=    is_element_not_visible    ${icon}
    Run Keyword If    (${is_visible}!=True)    Drag And Drop By Offset    ${category_slider}    -270    0            
    ${title}=    Get Element Attribute    ${icon}/a    title
    ${encoded_text}=   Encode String To Percent Encoding   ${title}
    Click Element    ${icon}
    Wait Until Location Is    ${url_staging_punpro_searched}${encoded_text}
    Location Should Be        ${url_staging_punpro_searched}${encoded_text}
    Go Back

Test Scenario - Category link - brand
    [Tags]    Category
    [Arguments]    ${icon}
    Scroll Element Into View    ${category_container}
    Wait Until Element Is Visible    ${category_brands}
    Click Element    ${category_brands}
    Sleep    0.5s
    ${is_visible}=    is_element_not_visible    ${icon}
    Run Keyword If    (${is_visible}!=True)    Drag And Drop By Offset    ${category_slider}    -300    0            
    ${title}=    Get Element Attribute    ${icon}/a    title
    ${encoded_text}=   Encode String To Percent Encoding   ${title}
    Click Element    ${icon}
    Wait Until Location Is    ${url_staging_punpro_searched}${encoded_text}
    Location Should Be        ${url_staging_punpro_searched}${encoded_text}
    Go Back

######### Services #########
Test Scenario - Services link
    [Tags]    Services
    [Arguments]    ${link}    ${url}
    Scroll Element Into View    ${link}
    Click link (same tab)       ${link}    ${url}
    Go Back

######### Affiliate #########
Test Scenario - Affiliate tab
    [Tags]    Affiliate
    [Arguments]    ${tab}    ${text}
    Wait Until Page Contains Element    ${tab}
    Scroll Element Into View    ${tab}
    Click Element    ${tab}
    ${is_visible}=    is_element_not_visible    ${affiliate_nodata}
    IF  ${is_visible}==True
        Element Text Should Be     ${affiliate_nodata}   ไม่มีข้อมูล
    ELSE
        Scroll Element Into View    ${affiliate_card_type}
        Wait Until Element Is Visible    ${affiliate_card_type}
        IF    "$text=='ทั้งหมด'"
            No Operation
        ELSE
            Element Text Should Be     ${affiliate_card_type}    ${text}
        END
    END