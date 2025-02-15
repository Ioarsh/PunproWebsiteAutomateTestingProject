*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#browser
${browser_chrome}           chrome

#url
${url_staging_punpro}                     https://staging-www.punpro.com/
${url_punpro_appStore}                    https://apps.apple.com/us/app/punpro/id1481304949
${url_punpro_appStore_th}                 https://apps.apple.com/th/app/punpro/id1481304949?l=th
${url_punpro_googlePlay}                  https://play.google.com/store/apps/details?id=com.punpro.android&referrer=utm_source%3Dpunprocomapp
${url_punpro_googlePlay_th}               https://play.google.com/store/apps/details?id=com.punpro.android
${url_punpro_facebook}                    https://www.facebook.com/punpromotion
${url_punpro_instagram}                   https://www.instagram.com/punpromotion/
${url_punpro_x}                           https://x.com/punpromotion/
${url_punpro_youtube}                     https://www.youtube.com/channel/UC1BK8F2ajNmKCSGc0TvYZQw
${url_staging_punpro_promotion}           https://staging-www.punpro.com/promotion
${url_staging_punpro_article}             https://staging-www.punpro.com/article
${url_staging_punpro_shoppper_posts}      https://staging-www.punpro.com/shopper_posts
${url_staging_punpro_promotion_online}    https://staging-www.punpro.com/promotion_online
${url_staging_punpro_partner_notlogin}    https://staging-www.punpro.com/login?f=/partner
${url_staging_punpro_partner_login}       https://staging-www.punpro.com/partner/register
${url_staging_punpro_coupons}             https://staging-www.punpro.com/coupons
${url_staging_punpro_contact}             https://staging-www.punpro.com/contact
${url_staging_punpro_search}              https://staging-www.punpro.com/search
${url_staging_punpro_searched}            https://staging-www.punpro.com/search?s=        #ข้อความที่ต้องการค้นหาต่อท้าย
${url_staging_punpro_category_groups}     https://staging-www.punpro.com/category_groups
${url_staging_punpro_policy}              https://staging-www.punpro.com/privacy-policy
${url_staging_punpro_my_coupons}          https://staging-www.punpro.com/my-coupons
${url_staging_punpro_jobs}                https://staging-www.punpro.com/jobs
${url_staging_punpro_bookmarks}           https://staging-www.punpro.com/bookmarks
${url_staging_punpro_profile}             https://staging-www.punpro.com/profile
${url_staging_punpro_privacy}             https://staging-www.punpro.com/profile-setting-privacy

#promotion_online
${url_staging_punpro_promotion_online_flashsale}    https://staging-www.punpro.com/promotion_online/flashsale

#Username_password
${username}    user
${password}    password