*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${firstpage}                  class=Breadcrumb__BreadcrumbItem-sc-1doigyk-1

# Page Navigation
${coupons_all}            id=รวมคูปอง-tab
${coupons_me}             id=คูปองของฉัน-tab

# all coupons
${coupons_list}             xpath=//*[@id="รวมคูปอง"]/div/div/div[2]/div
${coupons_zero}             xpath=//*[@id="รวมคูปอง"]/div/div/div[2]/div/div[15]/div
${coupons_one}              xpath=//*[@id="รวมคูปอง"]/div/div/div[2]/div/div[13]/div
${coupons_first_collect}    class=CardCoupon__ButtonReceive-sc-1acp9aa-8
${coupons_first_title}      class=CardCoupon__Title-sc-1acp9aa-3
${coupons_many}             xpath=//*[@id="รวมคูปอง"]/div/div/div[2]/div/div[2]/div

# coupons me (หน้า coupon)
${coupons_me_login}                class=ButtonSecondary__ButtonStyle-sc-4uq90l-0
${coupons_me_list}                 xpath=/html/body/div[2]/div/div[3]/div/div/div[2]/div/div[2]/div[2]/div/div/div
${coupons_me_first_use}            class=CardCouponMe__ButtonReceive-sc-1eulwuy-8
${coupons_me_detail}               class=MyCouponWithModal__CouponSection-sc-10enm4c-2
${coupons_me_using}                class=Button__ButtonStyle-zutoog-0
${coupons_me_using_confirm}        class=swal2-confirm
${coupons_me_using_cancel}         class=swal2-cancel
${coupons_me_using_popup}          class=swal2-popup
${coupons_me_using_tab_qrcode}     xpath=//*[@id="main-layout"]/div[4]/div/div/div[2]/div/div/div[1]/div/button[1]
${coupons_me_using_tab_barcode}    xpath=//*[@id="main-layout"]/div[4]/div/div/div[2]/div/div/div[1]/div/button[2]
${coupons_me_using_qrcode}         class=MyCouponWithModal__BlockQrcode-sc-10enm4c-13
${coupons_me_using_barcode}        class=MyCouponWithModal__SectionCode-sc-10enm4c-12
${coupons_me_using_close}          class=MyCouponWithModal__ButtonClose-sc-10enm4c-8

# my coupons (หน้า user)
${my_coupons_list}         xpath=//*[@id="main-layout"]/div[3]/div/div/div[2]/div[2]/div/div[2]/div/div


# coupons post
${coupons_post_collect}    class=coupon-detail__ButtonReceive-giq54f-11
${coupons_post_name}       class=Text__H1-sc-1b9v7rc-0
${coupons_post_quota}      class=coupon-detail__Quota-giq54f-5
${coupons_post_minus}      xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div[4]/div/div[2]/div/button[1]
${coupons_post_plus}       xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div[4]/div/div[2]/div/button[2]
${coupons_post_count}      xpath=//*[@id="main-layout"]/div[3]/div/div[2]/div/div[4]/div/div[2]/div/span

# popup
${coupons_post_popup_out}         xpath=/html/body/div[3]/div
${coupons_post_popup_out_text}    id=swal2-title