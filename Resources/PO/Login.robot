*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${email_variable} =             xpath=//input[@id="Email"]
${password_variable} =          css=input[id="Email"]
${rememberMe_variable} =        id=RememberMe
${submit_button_variable} =     xpath=//input[starts-with(@value,"Log")]
*** Keywords ***
Enter your "Email"
    Input Text  ${email_variable}  ${typing_email}
    Sleep  2s
Enter your "Password"
    Input Text  ${password_variable}  ${typing_password}
    Sleep  2s
Submit
    Select Checkbox  ${rememberMe_variable}
    Click Button  ${submit_button_variable}
    Sleep  2s
Verify Page Loaded
    Wait Until Page Contains  My account