*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${bottombar_promotion}           css=a.FooterSection__MenuText-sc-15kkac3-3[href='/promotion']
${bottombar_article}             css=a.FooterSection__MenuText-sc-15kkac3-3[href='/article']
${bottombar_shopper_posts}       css=a.FooterSection__MenuText-sc-15kkac3-3[href='/shopper_posts']
${bottombar_promotion_online}    css=a.FooterSection__MenuText-sc-15kkac3-3[href='/promotion_online']
${bottombar_partner}             css=a.FooterSection__MenuText-sc-15kkac3-3[href='/partner']
${bottombar_coupons}             css=a.FooterSection__MenuText-sc-15kkac3-3[href='/coupons']
${bottombar_contact}             css=a.FooterSection__MenuText-sc-15kkac3-3[href='/contact']

${bottombar_facebook}            xpath=//*[@id="main-layout"]/footer/div/div[2]/div[1]/div[2]/div/a[1]
${bottombar_instagram}           xpath=//*[@id="main-layout"]/footer/div/div[2]/div[1]/div[2]/div/a[2]
${bottombar_x}                   xpath=//*[@id="main-layout"]/footer/div/div[2]/div[1]/div[2]/div/a[3]
${bottombar_youtube}             xpath=//*[@id="main-layout"]/footer/div/div[2]/div[1]/div[2]/div/a[4]

${bottombar_1get1}        xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[1]/div[1]/a
${bottombar_50}           xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[1]/div[2]/a
${bottombar_phone}        xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[1]/div[3]/a
${bottombar_food}         xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[1]/div[4]/a
${bottombar_ticket}       xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[1]/div[5]/a
${bottombar_code}         xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[1]/div[6]/a

${bottombar_fashion}                xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[2]/div[1]/a
${bottombar_eat}                    xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[2]/div[2]/a
${bottombar_travel}                 xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[2]/div[3]/a
${bottombar_smart}                  xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[2]/div[4]/a
${bottombar_update}                 xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[2]/div[5]/a
${bottombar_talking}                xpath=//*[@id="main-layout"]/footer/div/div[2]/div[2]/div/div[2]/div[6]/a

${bottombar_appstore}     xpath=//*[@id="main-layout"]/footer/div/div[2]/div[3]/div/div[1]/a
${bottombar_playstore}    xpath=//*[@id="main-layout"]/footer/div/div[2]/div[3]/div/div[2]/a
