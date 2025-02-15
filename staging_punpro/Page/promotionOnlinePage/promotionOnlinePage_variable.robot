*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Highlight
${highlight_slider_active}    xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'swiper-slide-active')]
${highlight_slider_prev}      xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'prev')]
${highlight_slider_next}      xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'swiper-slide-duplicate-next')]
${highlight_btn_right}        xpath=//*[@id="main-layout"]/div[3]/div[1]/div/div/div/div/div[2]
${highlight_btn_left}         xpath=//*[@id="main-layout"]/div[3]/div[1]/div/div/div/div/div[1]

#Promotion Online
${promotion_online_first_pic}           class=CardStandardAffiliate__ImagePreview-sc-1hoj7gt-56
${promotion_online_first_text}          class=CardStandardAffiliate__CardFooter-sc-1hoj7gt-3
${promotion_online_first_like}          class=CardStandardAffiliate__ContentButtonLike-sc-1hoj7gt-21
${promotion_online_frist_like_count}    class=CardStandardAffiliate__ContentButtonCountLove-sc-1hoj7gt-24