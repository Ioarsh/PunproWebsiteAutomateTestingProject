*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${flashsale_container}                    class=HomeFlashSaleTabletDesign__ContainerFlashSale-shmflr-0
${flashsale_seeall}                       class=ButtonNextAllOutline__ButtonOutlineStyle-bdp13l-0
${flashsale_slider}                       xpath=//div[contains(@class, 'AffiliatePreviewFlashSale__SwipperElement-sc-1yyz7dm-0')]/div/div[contains(@class, 'swiper-wrapper')]
${flashsale_button_left}                  xpath=//div[contains(@class, 'AffiliatePreviewFlashSale__SwipperElement-sc-1yyz7dm-0')]/div/div[contains(@class, 'swiper-button-prev')]
${flashsale_button_right}                 xpath=//div[contains(@class, 'AffiliatePreviewFlashSale__SwipperElement-sc-1yyz7dm-0')]/div/div[contains(@class, 'swiper-button-next')]
${flashsale_button_disable}               swiper-button-disabled
${flashsale_card_firstcard}               xpath=//div[@aria-label='1 / 10']
${flashsale_card_firstcard_pic}           class=MiniCardStandardAffiliate__ImagePreview-sc-40fuvg-4
${flashsale_card_firstcard_text}          class=MiniCardStandardAffiliate__LayoutDetail-sc-40fuvg-6
${flashsale_card_firstcard_like}          xpath=/html/body/div[2]/div[2]/div[4]/div[4]/div/div/div/div[2]/div/div/div[4]/div[1]/div/div/div[2]/div[2]
${flashsale_card_firstcard_like_count}    xpath=/html/body/div[2]/div[2]/div[4]/div[4]/div/div/div/div[2]/div/div/div[4]/div[1]/div/div/div[2]/div[2]//div[contains(@class, 'MiniCardStandardAffiliate__ContentButtonCountLove-sc-40fuvg-27')]