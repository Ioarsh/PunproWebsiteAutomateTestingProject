*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${firstpage}                  class=Breadcrumb__BreadcrumbItem-sc-1doigyk-1

#shopper posts
${shopper_posts_container}        xpath=//*[@id="main-layout"]/div[3]/div/div/div[4]/div/div/div[2]/div/div
${firstcard_pic}                  class=CardShopperPost__CardComponent-sc-11d77tw-0
${firstcard_text}                 class=CardShopperPost__BlockTitle-sc-11d77tw-3
${firstcard_share}                xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div/div/div[2]/div/div[1]/div/div[1]/button
${firstcard_line}                 xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div/div/div[2]/div/div[1]/div/div[1]/button/div/button[3]
${firstcard_facebook}             xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div/div/div[2]/div/div[1]/div/div[1]/button/div/button[1]
${firstcard_x}                    xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div/div/div[2]/div/div[1]/div/div[1]/button/div/button[2]