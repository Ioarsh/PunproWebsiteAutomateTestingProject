*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#navBar
${navbar_main}                class=NavbarMenu__LinkHomePage-sc-1yfz0b-2
${navbar_promotion}           css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/promotion']
${navbar_article}             css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/article']
${navbar_shopper_posts}       css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/shopper_posts']
${navbar_promotion_online}    css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/promotion_online']
${navbar_partner}             css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/partner']
${navbar_coupons}             css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/coupons']
${navbar_contact}             css=a.NavbarMenu__MenuText-sc-1yfz0b-3[href='/contact']
${navbar_search}              class=InputSearch__InputComponent-g8n6cs-0