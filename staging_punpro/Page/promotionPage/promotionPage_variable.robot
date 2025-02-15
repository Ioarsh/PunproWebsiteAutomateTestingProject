*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#pin
${firstpage}                  class=Breadcrumb__BreadcrumbItem-sc-1doigyk-1
${pin_card_first_banner}      class=CardPromotion__A-sc-1n4ig57-2     
${pin_card_first_pic}         class=CardPromotion__CardComponent-sc-1n4ig57-0
${pin_card_first_text}        class=CardPromotion__BlockTitle-sc-1n4ig57-3
${pin_card_first_share}       class=CardPromotion__BlockShare-sc-1n4ig57-13
${pin_card_first_facebook}    xpath=/html/body/div[2]/div/div[3]/div/div/div[3]/div/div/div/div[4]/div[1]/div/div/div[1]/button/div/button[1]
${pin_card_first_x}           xpath=/html/body/div[2]/div/div[3]/div/div/div[3]/div/div/div/div[4]/div[1]/div/div/div[1]/button/div/button[2]
${pin_card_first_line}        xpath=/html/body/div[2]/div/div[3]/div/div/div[3]/div/div/div/div[4]/div[1]/div/div/div[1]/button/div/button[3]

#tab
${tab_1get1}        xpath=//button[.//span[contains(text(), '1 แถม 1')]]
${tab_50}           xpath=//button[.//span[contains(text(), '50% up')]]
${tab_phone}        xpath=//button[.//span[contains(text(), 'โปรมือถือ')]]
${tab_food}         xpath=//button[.//span[contains(text(), 'อาหาร')]]
${tab_ticket}       xpath=//button[.//span[contains(text(), 'ตั๋วถูก')]]
${tab_code}         xpath=//button[.//span[contains(text(), 'โค้ดส่วนลด')]]
${tab_container}    xpath=//div[contains(@class, 'ProFilterCategories__BlockMenuCategories-sc-1wksrij-0')]

#promotion
${promotion_container}    xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div
${firstcard_pic}          xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div
${firstcard_text}         xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[2]/div[1]/div[2]
${firstcard_banner}       xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/a
${firstcard_share}        xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[1]/button
${firstcard_line}         xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[1]/button/div/button[3]
${firstcard_x}            xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[1]/button/div/button[2]
${firstcard_facebook}     xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[1]/button/div/button[1]
${firstcard_like}         xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[2]/div[1]/div[4]/div[1]/div/i
${firstcard_bookmark}     xpath=//*[@id="main-layout"]/div[3]/div/div/div[5]/div/div/div[2]/div/div[1]/div/div[2]/div[1]/div[4]/div[2]/div/i
${like_inactive}          jOHQBq
${like_active}            ezrKox
${bookmark_inactive}      jOHQBq
${bookmark_active}        ezrKox