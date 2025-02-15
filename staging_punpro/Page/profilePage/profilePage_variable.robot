*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#common
${firstpage}          class=Breadcrumb__BreadcrumbItem-sc-1doigyk-1
${login_section}      class=LoginTemplate__LoginSection-zzd09y-0
${logout}             xpath=//button[text()='ออกจากระบบ']

#tab
${tab_bookmarks}      xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[1]/div/a[1]
${tab_coupon}         xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[1]/div/a[2]
${tab_profile}        xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[1]/div/a[3]
${tab_privacy}        xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[1]/div/a[4]

#profile
${profile_picture}                class=EditProfile__ImageProfile-b7kyn8-2
${profile_picture_input}          id=upload-button
${profile_name_textfield}         xpath=//input[@type='text']
${profile_date_textfield}         xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[4]/div/div/input
${profile_date_picker}            xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[4]/div/div/div/div/div
${profile_date_selector_year}     xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[4]/div/div/div/div/div/div/div[2]/div/form/select[2]
${profile_date_selector_month}    xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[4]/div/div/div/div/div/div/div[2]/div/form/select[1]            
${profile_gender_textfield}       xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[5]/div/select
${profile_gender_selected}        xpath=//option[@selected]
${profile_tel_textfield}          xpath=//input[@type='tel']
${profile_save}                   xpath=//button[text()='บันทึกข้อมูล']

#popup
${popup}            class=swal2-popup
${popup_confirm}    class=swal2-confirm