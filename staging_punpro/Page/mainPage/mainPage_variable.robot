*** Settings ***
Library    SeleniumLibrary

*** Variables ***
######### Main Page #########
#pop-up
${popup_image}             class=PPBNApp__BNAPPImage-sc-1nt01xd-2
${popup_close_button}      class=PPBNApp__BTNCloseBNAPP-sc-1nt01xd-3
${popup_url}               https://staging-www.punpro.com/app
${popup_animation}         xpath=//div[@class='PPBNApp__BNAPP-sc-1nt01xd-0 bVmEtn']//div[contains(@class, 'position-relative')]
${popup_animation_in}      animate__bounceInLeft
${popup_animation_out}     animate__bounceOutLeft

#highlight แยก slider จาก data-swiper-slide-index
${highlight_first}            class=PunproHighlight__PromotionOne-sc-1rtib62-4
${highlight_second}           class=PunproHighlight__PromotionTwo-sc-1rtib62-5
${highlight_slider}           class=swiper-slide
${highlight_slider_active}    xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'active')]
${highlight_slider_prev}      xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'prev')]
${highlight_slider_next}      xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'next')]

### category ###
${category_products}            id=filter-category-products
${category_brands}              id=filter-category-brands
${category_active}              CategoriesTypeFilter__MenuCategoryTypeActive-sc-922y4p-3    #class ที่ active
${category_inactive}            CategoriesTypeFilter__MenuCategoryType-sc-922y4p-1          #class ที่ ไม่ active
${category_container}           id=aff-content-0
${category_slider}              xpath=//div[contains(@class, 'BlockCategories__SwipperElement-x37hac-0')]/div
${category_see_all}             class=ButtonNextAllOutline__ButtonHomePageOutlineStyle-bdp13l-1
${category_product_shoe}        xpath=//div[contains(@id, 'aff-item-รองเท้าผ้าใบ0')]
${category_product_bag}         xpath=//div[contains(@id, 'aff-item-กระเป๋า1')]
${category_product_shirt}       xpath=//div[contains(@id, 'aff-item-เสื้อ2')]
${category_product_beauty}      xpath=//div[contains(@id, 'aff-item-ความงาม3')]
${category_product_it}          xpath=//div[contains(@id, 'aff-item-ไอที4')]
${category_product_pant}        xpath=//div[contains(@id, 'aff-item-กางเกง5')]
${category_product_skincare}    xpath=//div[contains(@id, 'aff-item-ดูแลผิว6')]
${category_product_sandal}      xpath=//div[contains(@id, 'aff-item-รองเท้าแตะ7')]
${category_product_hat}         xpath=//div[contains(@id, 'aff-item-หมวก8')]
${category_brand_adidas}        xpath=//div[contains(@id, 'aff-item-Adidas0')]
${category_brand_nike}          xpath=//div[contains(@id, 'aff-item-Nike1')]
${category_brand_lyn}           xpath=//div[contains(@id, 'aff-item-LYN2')]
${category_brand_fila}          xpath=//div[contains(@id, 'aff-item-FILA3')]
${category_brand_charles}       xpath=//div[contains(@id, 'aff-item-Charles&Keith4')]
${category_brand_uniqlo}        xpath=//div[contains(@id, 'aff-item-Uniqlo5')]
${category_brand_converse}      xpath=//div[contains(@id, 'aff-item-Converse6')]
${category_brand_guess}         xpath=//div[contains(@id, 'aff-item-Guess7')]
${category_brand_calvin}        xpath=//div[contains(@id, 'aff-item-CalvinKlein8')]
${category_brand_starbuck}      xpath=//div[contains(@id, 'aff-item-Starbucks9')]

#services
${services_shopper_posts}       xpath=//a[contains(@class, 'HomeServiceAllDesktop__MenuCategoryPro-sc-1vsg47l-1 jTEEaT')]/img[@alt='ฝากหิ้ว']
${services_promotion_online}    xpath=//a[contains(@class, 'HomeServiceAllDesktop__MenuCategoryPro-sc-1vsg47l-1 jTEEaT')]/div[text()='โปรออนไลน์']
${services_coupons}             xpath=//a[contains(@class, 'HomeServiceAllDesktop__MenuCategoryPro-sc-1vsg47l-1 jTEEaT')]/img[@alt='คูปอง']
${services_article}             xpath=//a[contains(@class, 'HomeServiceAllDesktop__MenuCategoryPro-sc-1vsg47l-1 jTEEaT')]/img[@alt='บทความ']
${services_promotion}           xpath=//a[contains(@class, 'HomeServiceAllDesktop__MenuCategoryPro-sc-1vsg47l-1 jTEEaT')]/div[text()='โปรแนะนำ']

#rec_article
${rec_article_container}                   class=BlockArticle__ComponentContainer-sc-1vaiz8v-0
${rec_article_seeall}                      class=ButtonNextAllOutline__ButtonArticleOutlineStyle-bdp13l-2
${rec_article_first_pic}                   class=MiniCardArticleHomePin__LayoutComponent-bmsai2-1
${rec_article_first_text}                  class=MiniCardArticleHomePin__LayoutDetail-bmsai2-11
${rec_article_first_like}                  xpath=//*[@id="main-layout"]/div[4]/div[5]/div/div/div/div[2]/div[3]/div/div[1]/div/div/div/div[1]/div[3]/div
${rec_article_first_like_count}            xpath=//*[@id="main-layout"]/div[4]/div[5]/div/div/div/div[2]/div[3]/div/div[1]/div/div/div/div[1]/div[3]/div/span[contains(@class, 'MiniCardArticleHomePin__TextCountLove-bmsai2-9')]
${rec_article_slider}                      xpath=/html/body/div[2]/div[2]/div[4]/div[5]/div/div/div/div[2]/div[1]/div/div[2]
${rec_article_slider_active}               xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'active')]
${rec_article_slider_active_pic}           class=CardArticleHomePin__LayoutComponent-sc-1b3x8f1-1
${rec_article_slider_active_text}          class=CardArticleHomePin__LayoutDetail-sc-1b3x8f1-11
${rec_article_slider_active_like}          class=CardArticleHomePin__BorderImageLove-sc-1b3x8f1-7
${rec_article_slider_active_like_count}    xpath=//div[contains(@class, 'CardArticleHomePin__BorderImageLove-sc-1b3x8f1-7')]/span[contains(@class, 'CardArticleHomePin__TextCountLove-sc-1b3x8f1-9')]
${rec_article_slider_prev}                 xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'prev')]
${rec_article_slider_next}                 xpath=//div[contains(@class, 'swiper-slide') and contains(@class, 'next')]

#shopper_post
${shopper_posts_container}           class=BlockShopperPost__ComponentContainer-valrxv-0
${shopper_posts_seeall}              xpath=//*[@id="main-layout"]/div[4]/div[6]/div/div/div/div[1]/div[2]
${shopper_posts_slider}              xpath=/html/body/div[2]/div[2]/div[4]/div[6]/div/div/div/div[2]/div/div/div/div[1]
${shopper_posts_first_pic}           class=SmallCardShopperPost__LayoutComponent-sc-1dij33y-1
${shopper_posts_first_text}          class=SmallCardShopperPost__LayoutDetail-sc-1dij33y-16
${shopper_posts_first_like}          class=SmallCardShopperPost__BorderImageLove-sc-1dij33y-11
${shopper_posts_first_like_count}    class=SmallCardShopperPost__TextCountLove-sc-1dij33y-13

#affiliate
@{affiliate_tab}    รับหิ้ว    โปรออนไลน์    โปรแนะนำ    บทความ
${affiliate_all}                          id=filter-affiliate-
${affiliate_shopper_posts}                id=filter-affiliate-shopper
${affiliate_promotion_online}             id=filter-affiliate-affiliate
${affiliate_recommend}                    id=filter-affiliate-promotion
${affiliate_article}                      id=filter-affiliate-article
${affiliate_card_container}               xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]
${affiliate_card_container_height}        xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]/div/div/div/div/div[1]/div
${affiliate_card_type}                    xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]/div/span[1]/div/div/div[1]/div[1]/span
${affiliate_card_firstcard_pic}           xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]/div/span[1]/div/div
${affiliate_card_firstcard_text}          xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]/div/span[1]/div/div/div[2]/div
${affiliate_card_firstcard_like}          xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]/div/span[1]/div/div/div[1]/div[3]/div
${affiliate_card_firstcard_like_count}    xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/div[6]/div/span[1]/div/div/div[1]/div[3]/div/span[2]
${affiliate_nodata}                       xpath=/html/body/div[2]/div[2]/div[4]/div[7]/div/p