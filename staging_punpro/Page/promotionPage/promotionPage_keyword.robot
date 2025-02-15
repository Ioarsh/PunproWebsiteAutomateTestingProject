*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./promotionPage_variable.robot
Resource   ../../default_keyword.robot

*** Keywords ***
Test Scenario - Tab
    [Arguments]    ${tabs}    ${tabs_url}
    Wait Until Page Contains Element    ${tab_container}
    Scroll Element Into View            ${tab_container}
    ${visible}=    is_element_not_visible    ${tabs}
    IF  ${visible}
        No Operation
    ELSE
        Execute Javascript    window.document.getElementsByClassName('ProFilterCategories__BlockMenuCategories-sc-1wksrij-0')[0].scrollLeft +=100
    END
    Click Element                       ${tabs}
    Wait Until Location Is              ${url_staging_punpro_promotion}?categories=${tabs_url}
    Click Element                       ${tabs}
    Wait Until Location Is              ${url_staging_punpro_promotion}