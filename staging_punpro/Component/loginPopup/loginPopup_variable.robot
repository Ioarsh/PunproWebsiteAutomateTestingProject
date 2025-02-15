*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#login
${login_popup_modal}        class=LoginWithModal__ModalLoginBody-sc-1w1mlxh-0
${login_background}         class=LoginWithModal__BlockLoginWithModal-sc-1w1mlxh-1
${login_container}          class=LoginTemplate__LoginSection-zzd09y-0
${login_google}             class=SocialLogin__ButtonGoogle-mfwgwp-3
${login_facebook}           class=SocialLogin__ButtonFacebook-mfwgwp-1
${login_email}              xpath=//button[contains(@class, 'LoginTemplate__ButtonAction-zzd09y-3') and contains(text(), 'เข้าสู่ระบบด้วยอีเมล')]
${login_register}           xpath=//button[contains(@class, 'LoginTemplate__ButtonAction-zzd09y-3') and contains(text(), 'สมัครสมาชิก')]
${login_close}              class=LoginTemplate__ButtonCloseModal-zzd09y-4
${login_fail_close}         class=swal2-confirm

#loginEmail
${login_email_emailField}       css=input.InputText__InputComponent-sc-1flkk8i-0[type='email']
${login_email_passwordField}    css=input.InputText__InputComponent-sc-1flkk8i-0[type='password'][placeholder='รหัสผ่าน']
${login_email_forgot}           class=LoginTemplate__ButtonAction-zzd09y-3
${login_email_cancel}           class=ButtonSecondary__ButtonStyle-sc-4uq90l-0
${login_email_enter}            xpath=//button[contains(@class, 'Button__ButtonStyle-zutoog-0') and contains(text(), 'เข้าสู่ระบบ')]
${login_email_close}            class=LoginTemplate__ButtonCloseModal-zzd09y-4

#loginEmailForget
${login_email_forgot_emailField}    css=input.InputText__InputComponent-sc-1flkk8i-0[type='email']
${login_email_forgot_cancel}        class=ButtonSecondary__ButtonStyle-sc-4uq90l-0
${login_email_forgot_close}         class=LoginTemplate__ButtonCloseModal-zzd09y-4
${login_email_forgot_send}          xpath=//button[contains(@class, 'Button__ButtonStyle-zutoog-0') and contains(text(), 'ส่งอีเมล')]

#register
${register_emailField}               css=input.InputText__InputComponent-sc-1flkk8i-0[type='email']
${register_passwordField}            css=input.InputText__InputComponent-sc-1flkk8i-0[type='password'][placeholder='รหัสผ่าน']
${register_confirm_passwordField}    css=input.InputText__InputComponent-sc-1flkk8i-0[type='password'][placeholder='รหัสผ่านอีกครั้ง']
${register_cancel}                   class=ButtonSecondary__ButtonStyle-sc-4uq90l-0
${register_register}                 xpath=//button[contains(@class, 'Button__ButtonStyle-zutoog-0') and contains(text(), 'สมัครสมาชิก')]
${register_close}                    class=LoginTemplate__ButtonCloseModal-zzd09y-4