*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    #Open Browser  about:blank  ${browser}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    Open Browser  about:blank  ${browser}
    Maximize Browser Window
Load
    Go To  ${url}

End Web Test
    Close Browser