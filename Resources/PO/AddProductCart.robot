*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${product_link_variable} =          css=div[class="details"]>h2>a
${addCart_button_variable} =        xpath=//input[@id='add-to-cart-button-4']
${shoppingCart_link_variable} =     xpath=//a[contains(.,"shopping cart")]
${Qauntity_input} =                 xpath=//input[@class="qty-input"]
${removeCart_checkbox} =            css=input[name="removefromcart"]
${update_shopping_cart} =           xpath=//input[@name="updatecart"]

*** Keywords ***
Add product to my cart
    Click Link  ${product_link_variable}
    Sleep  2s
    Click Button  ${addCart_button_variable}
    Sleep  3s
    Click Link  ${shoppingCart_link_variable}

Verify Page Loaded
    Wait Until Page Contains  $3,600.00
    [Return]  Found it!

Update Quantity
    Clear Element Text  ${Qauntity_input}
    Input Text  ${Qauntity_input}  4
    Click Button  ${update_shopping_cart}
    Wait Until Page Contains  $7,200.00

remove
    Select Checkbox  ${removeCart_checkbox}
    Click Button  ${update_shopping_cart}
    Wait Until Page Contains  Your Shopping Cart is empty!