*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.bt.com/

*** Test Cases ***
BT Web Page Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  5
    Handle Cookies Pop-up
    Sleep  5
    Hover to Mobile Menu
    Select Mobile Phones
    Verify Banner Count
    Scroll and Click View SIM Only Deals
    Validate Page Title
    Validate Offer Text
    Close Browser

*** Keywords ***
Handle Cookies Pop-up
    # xpath not able to find sometime
    ${accept_button} =  Element Should Be Visible  xpath:/html/body/div[8]/div[1]/div/div[3]/a[2]
    Click Element  ${accept_button}

Hover to Mobile Menu
    Mouse Over  xpath://a[@aria-label='Mobile']

Select Mobile Phones
    Click Element  xpath://a[text()='Mobile phones']

Verify Banner Count
    ${banners} =  Get WebElements  xpath://div[@class='bt-ac-banner']
    Length Should Be At Least  ${banners}  3  Banners count is less than 3

Scroll and Click View SIM Only Deals
    Execute Javascript  window.scrollTo(0, document.body.scrollHeight)
    Click Element  xpath://a[text()='View SIM only deals']

Validate Page Title
    ${title} =  Get Title
    Should Be Equal As Strings  ${title}  SIM only deals | Plans, contracts & tablets | BT Mobile

Validate Offer Text
    ${offer_text} =  Get Text  xpath://p[contains(text(),'30% off and double data')]
    Should Contain  ${offer_text}  30% off and double data was 125GB 250GB Essential Plan, was £27 £18.90 per month
