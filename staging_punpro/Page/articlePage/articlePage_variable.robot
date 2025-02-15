*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${firstpage}                  class=Breadcrumb__BreadcrumbItem-sc-1doigyk-1

#tab
${tab_container}              class=BlogFilterCategories__BlockMenuCategories-da5lzc-0
${tab_fashion}                xpath=//button[.//span[contains(text(), 'โปรสายแฟ')]]
${tab_eat}                    xpath=//button[.//span[contains(text(), 'โปรกิน')]]
${tab_travel}                 xpath=//button[.//span[contains(text(), 'โปรเที่ยว')]]
${tab_smart}                  xpath=//button[.//span[contains(text(), 'โปรสมาร์ท')]]
${tab_update}                 xpath=//button[.//span[contains(text(), 'โปรอัพเดท')]]
${tab_talking}                xpath=//button[.//span[contains(text(), 'โปรชวนคุย')]]

#recommend
${recommend_container}              id=aff-content-0

#article
${article_container}              xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div
${firstcard_pic}                  class=CardArticle__CardComponent-sc-8so5hb-0
${firstcard_text}                 class=CardArticle__BlockTitle-sc-8so5hb-2
${firstcard_like}                 xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[2]/div
${firstcard_like_count}           xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[1]/div
${firstcard_bookmark}             xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[1]
${firstcard_bookmark_inactive}    css=#main-layout > div:nth-child(4) > div > div > div:nth-child(4) > div > div > div:nth-child(2) > div > div > div:nth-child(1) > div > div.CardArticle__BlockBookmark-sc-8so5hb-7.fTnudQ > div > i
${firstcard_bookmark_active}      css=#main-layout > div:nth-child(4) > div > div > div:nth-child(4) > div > div > div:nth-child(2) > div > div > div:nth-child(1) > div > div.CardArticle__BlockBookmark-sc-8so5hb-7.fTnudQ > div > svg
${firstcard_share}                xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[3]/div/div
${firstcard_line}                 xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[3]/div/div[1]/div[1]/button[3]
${firstcard_facebook}             xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[3]/div/div[1]/div[1]/button[1]
${firstcard_x}                    xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[3]/div/div[1]/div[1]/button[2]
${firstcard_clipboard}            xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div/div[1]/div/div[2]/div[2]/div[2]/div[3]/div/div[1]/div[1]/button[4]
