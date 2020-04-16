*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${product_link_variable} =      xpath=//div[@class="details"]//a
${add_to_wishlist_button} =     id=add-to-wishlist-button-4
${navigate_to_wishlist} =       xpath=//div[@class="bar-notification success"]//a
#${navigate_to_wishlist}=       //p/a[@href="/wishlist"]
${Qauntity_input} =             xpath=//input[@class="qty-input"]
${remove_wishlist} =            xpath=//input[@name="removefromcart"]
${update_wishlist} =            xpath=//input[@name="updatecart"]
*** Keywords ***
Add Product to My Wishlist
    Click Link  ${product_link_variable}
    Sleep  2s
    Click Button  ${add_to_wishlist_button}
    Sleep  4s
    Click Link  ${navigate_to_wishlist}
    Sleep  2s
    Wait Until Page Contains  ${first_product_name}

Update Quantity
    Clear Element Text  ${Qauntity_input}
    Input Text  ${Qauntity_input}  4
    Click Button  ${update_wishlist}
    Wait Until Page Contains  $7,200.00
    Sleep  2s

Remove Wishlist
    Select Checkbox  ${remove_wishlist}
    #Click Button  ${remove_wishlist}
    Sleep  2s
    Click Button  ${update_wishlist}
    Sleep  2s
    Wait Until Page Contains  The wishlist is empty!