*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${checkout_button} =    xpath=//button[@name="checkout"]
${terms-of-service} =   id=termsofservice
${checkout_as_guest} =  xpath=//input[@class="button-1 checkout-as-guest-button"]
${new_fname} =          id=BillingNewAddress_FirstName
${new_lname} =          id=BillingNewAddress_LastName
${new_email} =          id=BillingNewAddress_Email
${select_country} =     id=BillingNewAddress_CountryId
${city_input} =         css=input[name="BillingNewAddress.City"]
${new_address} =        id=BillingNewAddress_Address1
${zip_input} =          id=BillingNewAddress_ZipPostalCode
${Phone_Number} =       name=BillingNewAddress.PhoneNumber
${continue_checkout} =  css=div[id="billing-buttons-container"]>input
${continue_shipping} =  xpath=//input[@class="button-1 shipping-method-next-step-button"]
${continue_payment} =   xpath=//input[@class="button-1 payment-method-next-step-button"]
${select_creditCart} =  id=CreditCardType
${Cardholder_name} =    id=CardholderName
${Card_Number} =        name=CardNumber
${Expire_Month} =       xpath=//select[@id="ExpireMonth"]
${Expire_Year} =        xpath=//select[@name="ExpireYear"]
${Card_Code} =          id=CardCode
${payment_Next_Step} =  xpath=//input[@class="button-1 payment-info-next-step-button"]
${confirm_payment} =    xpath=//input[@class="button-1 confirm-order-next-step-button"]
${order_completed} =    xpath=//input[@class="button-1 order-completed-continue-button"]

*** Keywords ***
User Can Checkout
    Select Checkbox  ${terms-of-service}
    Sleep  2s
    Click Button  ${checkout_button}
    Sleep  2s
    Click Button  ${checkout_as_guest}
    Sleep  2s

Billing Address
    Input Text  ${new_fname}  ${typing_new_fname}  clear=True
    Sleep  2s
    Input Text  ${new_lname}  ${typing_new_lname}  clear=True
    Sleep  2s
    Input Text  ${new_email}  ${typing_new_email}  clear=True
    Sleep  2s
    Select From List By Value  ${select_country}  123
    Sleep  2s
    Input Text  ${city_input}  ${typing_city}  clear=True
    Sleep  2s
    Input Text  ${new_address}  ${typing_new_address}  clear=True
    Sleep  2s
    Input Text  ${zip_input}  ${typing_zip}  clear=True
    Sleep  2s
    Input Text  ${Phone_Number}  ${typing_phoneNumber}  clear=True
    Sleep  2s
    Click Button  ${continue_checkout}
    Sleep  2s
    Page Should Contain  Shipping address

Continue Shipping Addresss
    Select Radio Button  shippingoption  shippingoption_1
    Sleep  2s
    Click Button  ${continue_shipping}
    Sleep  2s
    Wait Until Page Contains  Pay by cheque or money order

Pay by credit or debit card
    Select Radio Button  paymentmethod  paymentmethod_1
    Sleep  2s
    Click Button  ${continue_payment}
    Sleep  2s
    Select From List By Value  ${select_creditCart}  MasterCard
    Sleep  2s
    Input Text  ${Cardholder_name}  ${typing_Cardholder_name}  clear=True
    Sleep  2s
    Input Text  ${Card_Number}  ${typing_Card_Number}  clear=True
    Sleep  2s
    Select From List By Value  ${Expire_Month}  ${Expire_Month_Typing}
    Sleep  2s
    Select From List By Value  ${Expire_Year}  ${Expire_Year_Typing}
    Sleep  2s
    Input Text  ${Card_Code}  ${typing_Card_Code}  clear=True
    Sleep  2s
    Click Button  ${payment_Next_Step}
    Sleep  2s
    #Page Should Contain  Payment Method: Credit Card
    #Sleep  2s
    #Page Should Contain  Shipping Method: Next Day Air
    #Sleep  2s
    Wait Until Page Contains  ${first_product_name}
    Sleep  2s
    Click Button  ${confirm_payment}
    Sleep  2s
    Wait Until Page Contains  Thank you
    Sleep  2s
    Wait Until Page Contains  Your order has been successfully processed!
    Sleep  2s
    Click Button  ${order_completed}
    Sleep  2s
    Page Should Contain  Welcome to our store