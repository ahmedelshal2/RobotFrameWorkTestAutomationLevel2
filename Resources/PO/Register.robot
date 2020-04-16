*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${radio_button_variable} =      xpath=//input[@id="gender-male"]
${first_name_variable} =        id=FirstName
${last_name_variable} =         id=LastName
${email_variable} =             id=Email
${password_variable} =          id=Password
${confirm_password_variable} =  id=ConfirmPassword
${register_button_variable} =   xpath=//input[@id="register-button"]
${continue_button_variable} =   css=input[name="register-continue"]
*** Keywords ***
Fill Personal Details
    Click Button  ${radio_button_variable}
    Sleep  1s
    Input Text  ${first_name_variable}  ${typing_first_name}
    Sleep  1s
    Input Text  ${last_name_variable}  ${typing_second_name}
    Sleep  1s
    Input Text  ${email_variable}  ${typing_email}
    Sleep  1s
    Input Text  ${password_variable}  ${typing_password}
    Sleep  1s
    Input Text  ${confirm_password_variable}  ${typing_password}
    Sleep  1s
    Click Button  ${register_button_variable}
    Sleep  1s
Verify Registration Completed and Continue
    Wait Until Page Contains  Your registration completed
    Sleep  3s
    Click Button  ${continue_button_variable}
    Sleep  1s
