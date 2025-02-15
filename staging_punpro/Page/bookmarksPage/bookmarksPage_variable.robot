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

#card
${firstcard_pic}         class=CardArticle__CardComponent-m1xoxy-0
${firstcard_text}        class=CardArticle__BlockTitle-m1xoxy-2
${firstcard_share}       class=ButtonShare__Button-sc-16scpvv-0
${firstcard_facebook}    xpath=//*[@id="list-bookmark"]/div/div/div[1]/div/div[1]/button/div/button[1]
${firstcard_x}           xpath=//*[@id="list-bookmark"]/div/div/div[1]/div/div[1]/button/div/button[2]
${firstcard_line}        xpath=//*[@id="list-bookmark"]/div/div/div[1]/div/div[1]/button/div/button[3] 
${firstcard_like}        xpath=//*[@id="list-bookmark"]/div/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div
${firstcard_bookmark}    xpath=//*[@id="list-bookmark"]/div/div/div[1]/div/div[2]/div[1]/div[3]/div[2]/div
