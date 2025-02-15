*** Settings ***
Library    SeleniumLibrary
Resource   ./appPage_variable.robot
Resource   ../../default_keyword.robot

*** Keywords ***
Open App Page
    Open web browser (maximize)    ${url_appPage}    ${browser_chrome}