*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Library     ../utility.py
Resource    ./default_variable.robot

*** Keywords ***
#Open browser (put url, put browser)
Open web browser (maximize)
    [Tags]    Default
    [Arguments]     ${url}     ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

#Click link that expect to open new tab
Click link (new tab)
    [Tags]    Default
    [Arguments]    ${link}    ${url}
    Wait Until Element Is Visible    ${link}
    Click Element                    ${link}
    Wait Until Keyword Succeeds    10x    1s    Switch Window    url=${url}
    Location Should Be               ${url}

#Click link that expect to change url of same tab
Click link (same tab)
    [Tags]    Default
    [Arguments]    ${link}    ${url}
    Wait Until Element Is Visible    ${link}
    Click Element                    ${link}
    Wait Until Location Is           ${url}
    Location Should Be               ${url}

#สำหรับใช้เป็นเงื่อนไขตรวจว่า element นี้ไม่แสดง
is_element_not_visible    
    [Arguments]    ${locator}
    ${result}    Run Keyword And Return Status    Wait Until Element Is Visible     ${locator}
    RETURN    ${result}

#ใช้สำหรับเปลี่ยน String เป็น URL
Encode String to URL
    [Arguments]    ${text}
    ${encoded_text}=   Encode String To Percent Encoding   ${text}
    ${encoded_text}=    Replace String    ${encoded_text}    %20    +
    RETURN    ${encoded_text}

######### Card #########
Check card link (class)    #ต้องใช้ locator เป็น class เท่านั้น
    [Tags]    Card
    [Arguments]    ${clickable}
    Wait Until Page Contains Element    ${clickable}
    Scroll Element Into View    ${clickable}
    Wait Until Element Is Visible       ${clickable}
    ${url}=    Get Element Attribute    ${clickable} a    href
    Click Element                       ${clickable} a
    Wait Until Location Is              ${url}
    Location Should Be                  ${url}
    Go Back

Check card link (xpath)    #ต้องใช้ locator เป็น xpath เท่านั้น
    [Tags]    Card
    [Arguments]    ${clickable}
    Wait Until Page Contains Element    ${clickable}
    Scroll Element Into View    ${clickable}
    Wait Until Element Is Visible       ${clickable}
    ${url}=    Get Element Attribute    ${clickable}/a    href
    Click Element                       ${clickable}/a
    Wait Until Location Is              ${url}
    Location Should Be                  ${url}
    Go Back

Check card like number
    [Tags]    Card
    [Arguments]    ${button}    ${count}
    Wait Until Page Contains Element    ${button}
    Scroll Element Into View            ${button}
    Wait Until Element Is Visible       ${button}
    ${like_number}=       Get Text    ${count}
    ${like_number}=       Text To Number    ${like_number}
    Click Element                       ${button}
    ${current_number}=    Get Text      ${count}
    ${current_number}=    Text To Number    ${current_number}
    ${checknum}    Evaluate    ${like_number}+1
    Should Be Equal    ${checknum}      ${current_number}
    Click Element                       ${button}
    ${current_number}=    Get Text      ${count}
    ${current_number}=    Text To Number    ${current_number}
    Should Be Equal    ${like_number}    ${current_number}

Check card like (second class)
    [Tags]    Card
    [Arguments]    ${button}    ${active}    ${inactive}
    Wait Until Page Contains Element    ${button}
    Scroll Element Into View            ${button}
    Wait Until Element Is Visible       ${button}
    Click Element                       ${button}
    ${type}=    Get Element Attribute    ${button}    class
    ${type}=    Get Second Class Part    ${type}
    Should Be Equal    ${type}    ${active}
    Click Element                       ${button}
    ${type}=    Get Element Attribute    ${button}    class
    ${type}=    Get Second Class Part    ${type}
    Should Be Equal    ${type}    ${inactive}

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

