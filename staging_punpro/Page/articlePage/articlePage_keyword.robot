*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./articlePage_variable.robot
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
    Element Should Be Visible           ${recommend_container}
    Click Element                       ${tabs}
    Wait Until Location Is              ${url_staging_punpro_article}?categories=${tabs_url}
    Element Should Not Be Visible       ${recommend_container}
    Click Element                       ${tabs}
    Wait Until Location Is              ${url_staging_punpro_article}
    Element Should Be Visible           ${recommend_container}