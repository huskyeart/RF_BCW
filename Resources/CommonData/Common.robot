*** Settings ***
Library    SeleniumLibrary
*** Variables ***

${env}   BCW
&{url}   BCW=http://localhost:7600/   BCWADMIN=http://localhost:7600/administrator    Cp=     Fairmarket=

*** Keywords ***

Open Web

    Open Browser    ${url.${env}}    chrome
    Maximize Browser Window
    Sleep  2s


Close
    Sleep  3s
    Close Browser 



