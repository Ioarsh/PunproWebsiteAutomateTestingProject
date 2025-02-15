*** Settings ***
Library           SeleniumLibrary
Resource          ./cookiesPopup_keyword.robot
Suite Setup       Set Selenium Speed    0.1
Suite Teardown    Close All Browsers
Test Setup        Open web browser (maximize)    ${url_staging_punpro}    ${browser_chrome}
Test Teardown     Close Browser

*** Test Cases ***
Case 001 Cookies - close
    Accept cookies
    Element Should Not Be Visible    ${cookie_session}

Case 002 Cookes - policy
    Wait Until Element Is Visible    ${cookie_more}
    Click Element                    ${cookie_more}
    Wait Until Location Is           ${url_staging_punpro_policy}
    Location Should Be               ${url_staging_punpro_policy}
    