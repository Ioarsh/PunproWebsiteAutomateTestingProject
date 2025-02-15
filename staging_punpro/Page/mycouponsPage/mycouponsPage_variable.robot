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

#coupons
${coupons_first_use}            class=CardCouponMe__ButtonReceive-sc-1eulwuy-8
${coupons_detail}               class=MyCouponWithModal__DescSection-sc-10enm4c-5
${coupons_using}                class=Button__ButtonStyle-zutoog-0
${coupons_using_popup}          class=swal2-popup
${coupons_using_cancel}         class=swal2-cancel
${coupons_using_confirm}        class=swal2-confirm
${coupons_using_tab_barcode}    xpath=//*[@id="main-layout"]/div[4]/div/div/div[2]/div/div/div[1]/div/button[2]
${coupons_using_tab_qrcode}     xpath=//*[@id="main-layout"]/div[4]/div/div/div[2]/div/div/div[1]/div/button[1]
${coupons_using_qrcode}         class=MyCouponWithModal__BlockQrcode-sc-10enm4c-13
${coupons_using_barcode}        class=MyCouponWithModal__SectionCode-sc-10enm4c-12
${coupons_using_close}          class=MyCouponWithModal__ButtonClose-sc-10enm4c-8