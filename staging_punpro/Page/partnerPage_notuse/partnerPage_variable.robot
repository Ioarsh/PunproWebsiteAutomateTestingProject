*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#common
${popup}        class=swal2-popup
${popup_ok}     class=swal2-confirm

#term
${login_section}           class=LoginTemplate__LoginSection-zzd09y-0
${partner_term}            class=FormPartner__Form-sc-1asprsa-1
${partner_link_ios}        xpath=//*[@id="main-layout"]/div[3]/div/div/div/div/div[1]/div/div/div/p[11]/a
${partner_link_android}    xpath=//*[@id="main-layout"]/div[3]/div/div/div/div/div[1]/div/div/div/p[12]/a
${partner_back}            class=ButtonSecondary__Secondary-sc-1cxp1jn-0
${partner_next}            class=ButtonSolid__Solid-sc-1akleho-0
${partner_accept}          id=checkbox-accept-policy-partner

#form
${partner_accept_image}    id=checkbox-accept-image-copyright
${partner_shopname}        xpath=//label[text()='ชื่อร้านค้า *']/following-sibling::input
${partner_shopurl}         xpath=//label[text()='ชื่อสำหรับ URL ร้านค้า (ภาษาอังกฤษ ตัวเลข และ เครื่องหมาย - ) *']/following-sibling::input
${partner_brand}           xpath=//label[text()='แนบโลโก้ Brand ของท่าน (ไฟล์ png) เท่านั้น *']/following-sibling::input
${partner_type}            xpath=//label[text()='ประเภทสินค้า หรือบริการ *']/following-sibling::select
${partner_area}            xpath=
