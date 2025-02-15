*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url_appPage}              https://staging-www.punpro.com/app
${app_appStore}             css=a.DownloadApp__LinkMobile-sc-1j1vs5n-10[href="https://apps.apple.com/app/apple-store/id1481304949?pt=120465973&ct=punprocomapp&mt=8"]
${app_googlePlay}           css=a.DownloadApp__LinkMobile-sc-1j1vs5n-10[href="https://play.google.com/store/apps/details?id=com.punpro.android&referrer=utm_source%3Dpunprocomapp"]
${app_back}                 css=a.DownloadApp__LinkFill-sc-1j1vs5n-5[href="/"]