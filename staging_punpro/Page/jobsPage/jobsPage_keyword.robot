*** Settings ***
Library    SeleniumLibrary
Library    ../../../utility.py
Resource   ./jobsPage_variable.robot
Resource   ../../default_keyword.robot

*** Keywords ***
Open Job Detail
    [Arguments]    ${select_job}    ${select_job_detail}
    Wait Until Page Contains Element    ${select_job}
    Wait Until Keyword Succeeds    10x    1s    Scroll Element Into View    ${select_job}
    Wait Until Element Is Visible       ${select_job}
    Click Element                       ${select_job}
    Wait Until Keyword Succeeds    10x    1s    Scroll Element Into View    ${select_job_detail}
    Element Should Be Visible           ${select_job_detail}
    Sleep    0.5s
    Wait Until Keyword Succeeds    10x    1s    Scroll Element Into View    ${select_job}
    Click Element                       ${select_job}
    Element Should Not Be Visible    ${select_job_detail}
    