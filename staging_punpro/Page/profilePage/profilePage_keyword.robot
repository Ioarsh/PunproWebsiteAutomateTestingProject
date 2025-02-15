*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./profilePage_variable.robot
Resource   ../../default_keyword.robot
Resource   ../../Component/loginPopup/loginPopup_keyword.robot
Resource   ../../Component/cookiesPopup/cookiesPopup_keyword.robot

*** Keywords ***
Login within page as
    [Arguments]    ${username}    ${password}
    Element Should Be Visible    ${login_section}
    Click login with email
    Login as                     ${username}   ${password}
    Wait Until Keyword Succeeds    10x    0.1    Wait Until Element Is Not Visible    ${login_section}

Open browser, Maximize and Login withinpage
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open web browser (maximize) and accept cookies    ${url}    ${browser}
    Login within page as    ${username}    ${password}
        
Change tab
    [Arguments]    ${tab}    ${location}
    Wait Until Element Is Visible    ${tab}
    Click Element                    ${tab}
    Wait Until Location Is           ${location}

Log out
    Wait Until Page Contains Element    ${logout}
    Scroll Element Into View            ${logout}
    Wait Until Element Is Visible       ${logout}
    Click Element                       ${logout}
    Wait Until Location Is              ${url_staging_punpro}

Input Profile Name
    [Arguments]    ${name}
    Wait Until Page Contains Element    ${profile_name_textfield}
    Scroll Element Into View            ${profile_name_textfield}
    Wait Until Element Is Visible       ${profile_name_textfield}
    IF    '${name}'=='${EMPTY}'
        Click Element    ${profile_name_textfield}
        Press Keys       ${profile_name_textfield}    CTRL+A    BACKSPACE
    ELSE
        Input Text    ${profile_name_textfield}    ${name}
    END

Input Profile Date
    [Arguments]    ${day}    ${month}    ${year}
    Wait Until Page Contains Element    ${profile_date_textfield}
    Scroll Element Into View            ${profile_date_textfield}
    Wait Until Element Is Visible       ${profile_date_textfield}
    Click Element                       ${profile_date_textfield}
    Wait Until Page Contains Element    ${profile_date_picker}
    Scroll Element Into View            ${profile_date_picker}
    Wait Until Element Is Visible       ${profile_date_picker}
    Select From List By Value           ${profile_date_selector_year}    ${year}
    ${month_int}=    text_to_number    ${month}
    ${month_index}=    Evaluate    ${month_int}-1
    Select From List By Value           ${profile_date_selector_month}    ${month_index}
    Click Element    xpath=//div[@class='DayPicker-Day' and text()='${day}']

Input Profile Gender
    #เลือกเพศซึ่งมี 3 ตัวเลือกคือ     not_specified    male    female
    [Arguments]    ${gender}
    Wait Until Page Contains Element    ${profile_gender_textfield}
    Scroll Element Into View            ${profile_gender_textfield}
    Wait Until Element Is Visible       ${profile_gender_textfield} 
    Select From List By Value           ${profile_gender_textfield}    ${gender}

Input Profile Tel
    [Arguments]    ${tel}
    Wait Until Page Contains Element    ${profile_tel_textfield}
    Scroll Element Into View            ${profile_tel_textfield}
    Wait Until Element Is Visible       ${profile_tel_textfield}
    IF    '${tel}'=='${EMPTY}'
        Click Element    ${profile_tel_textfield}
        Press Keys       ${profile_tel_textfield}   CTRL+A    BACKSPACE
    ELSE
        Input Text    ${profile_tel_textfield}    ${tel}
    END

Input Profile Data
    [Arguments]    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Input Profile Name      ${name}
    IF  ('${year}'=='${EMPTY}') and ('${month}'=='${EMPTY}') and ('${day}'=='${EMPTY}')
        No Operation
    ELSE
        Input Profile Date      ${day}    ${month}    ${year}
    END
    IF  '${gender}'=='${EMPTY}'
        No Operation
    ELSE
        Input Profile Gender    ${gender}
    END
    Input Profile Tel       ${telephone}

Input And Confirm
    [Arguments]    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Input Profile Data    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Wait Until Page Contains Element    ${profile_save}
    Scroll Element Into View            ${profile_save}
    Wait Until Element Is Visible       ${profile_save}
    Click Element    ${profile_save}

Test Scenario - Save - Fail
    [Documentation]    ตรวจสอบการบันทึกข้อมูลโดยไม่สามารถบันทึกข้อมูลได้
    [Arguments]    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Input And Confirm    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Wait Until Element Is Visible        ${popup}
    Wait Until Page Contains             บันทึกข้อมูลไม่สำเร็จ
    Wait Until Page Contains Element     ${popup_confirm}
    Scroll Element Into View             ${popup_confirm}
    Wait Until Element Is Visible        ${popup_confirm}
    Click Element                        ${popup_confirm}
    Wait Until Element Is Not Visible    ${popup}

Test Scenario - Save - Success
    [Documentation]    ตรวจสอบการบันทึกข้อมูลที่สำเร็จ
    [Arguments]    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Input And Confirm    ${name}    ${day}    ${month}    ${year}    ${gender}    ${telephone}
    Wait Until Element Is Visible        ${popup}
    Wait Until Page Contains             บันทึกข้อมูลสำเร็จ
    Wait Until Element Is Not Visible    ${popup}
    Reload Page
    Wait Until Page Contains Element     ${profile_name_textfield}
    Wait Until Page Contains Element     ${profile_date_textfield}
    Wait Until Page Contains Element     ${profile_gender_textfield}
    Wait Until Page Contains Element     ${profile_tel_textfield}

    #name check
    ${value_name}=    Get Element Attribute    ${profile_name_textfield}    value
    Should Be Equal As Strings           ${value_name}    ${name}
    
    #date check
    IF  ('${year}'=='${EMPTY}') and ('${month}'=='${EMPTY}') and ('${day}'=='${EMPTY}')
        No Operation
    ELSE
        ${value_date}=    Get Element Attribute    ${profile_date_textfield}    value
        ${date}=    convert_date    ${day}    ${month}    ${year}
        Should Be Equal As Strings    ${value_date}    ${date}
    END

    #gender check
    ${value_gender}=    Get Element Attribute    ${profile_gender_selected}    value
    IF  ('${gender}'=='${EMPTY}')
        ${gender}=    Set Variable    ${value_gender}
    END
    ${value_gender}=    Get Element Attribute    ${profile_gender_selected}    value
    Should Be Equal As Strings    ${value_gender}    ${gender}

    #tel check
    ${value_tel}    Get Element Attribute    ${profile_tel_textfield}    value
    IF  ('${telephone}'=='${EMPTY}')
        ${telephone}=    Set Variable    ${value_tel}
    END
    Should Be Equal As Strings           ${value_tel}    ${telephone}
