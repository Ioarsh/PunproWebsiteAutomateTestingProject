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

#privacy
${privacy_delete}              class=Button__ButtonStyle-zutoog-0
${privacy_delete_cancel}       class=DeleteMemberForm__ButtonText-sc-18xu3h1-0
${privacy_delete_confirm}      xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div[2]/div/div/div/div/div/form/div[2]/button
${privacy_delete_checkbox}     xpath=//*[@id="is-checked"]          
${privacy_popup}               class=DeleteMemberForm__BlockFormProfile-sc-18xu3h1-2
${privacy_delete_textfield}    class=DeleteMemberForm__Textarea-sc-18xu3h1-5

#popup
${popup}            class=swal2-popup
${popup_confirm}    class=swal2-confirm