*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${register_link_variable} =     xpath=//a[contains(.,"Register")]
${logout_link_variable} =       xpath=//a[contains(.,"Log out")]
${login_link_variable} =        xpath=//a[contains(.,"Log in")]
${search_text_variable} =       id=small-searchterms
${search_button_variable} =     xpath=//input[@value="Search"]
*** Keywords ***
Register
    Click Link  ${register_link_variable}
    Sleep  2s
Verify Page Loaded
    Wait Until Page Contains  Welcome to our store
    Sleep  2s
Logout
    Click Link  ${logout_link_variable}
    Sleep  2s
Click to Login Link
    Click Link  ${login_link_variable}
    Sleep  2s
Enter "First Product Name"
    Input Text  ${search_text_variable}  ${first_product_name}
    Sleep  2s
    Click Button  ${search_button_variable}
    Sleep  2s

Enter "Second Product Name"
    Input Text  ${search_text_variable}  ${second_product_name}
    Sleep  2s
    Click Button  ${search_button_variable}
    Sleep  2s