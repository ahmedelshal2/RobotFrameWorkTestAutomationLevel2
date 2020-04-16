*** Settings ***
Documentation  user can add products to my cart
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Data/InputData.robot
Resource  ../Resources/ecommerceApp.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
# robot -d results/checkout tests/05__checkoutProduct.robot

*** Test Cases ***
User Can Checkout Product
    [Tags]  Checkout
    ecommerceApp."Add Cart" to product
    Sleep  3s
    ecommerceApp.Update "Quantity" Shopping Cart
    Sleep  3s
    ecommerceApp.Click on Checkout
    ecommerceApp.Fill Billing Address and Continue Shipping
    ecommerceApp.Payment Method
