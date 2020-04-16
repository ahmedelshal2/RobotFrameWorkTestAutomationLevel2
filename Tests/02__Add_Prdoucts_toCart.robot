*** Settings ***
Documentation  user can add products to my cart
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Data/InputData.robot
Resource  ../Resources/ecommerceApp.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
# robot -d results/add-product-cart tests/02__Add_Prdoucts_toCart.robot
# robot -d results/add-product-cart -i Smoke -L debug tests/02__Add_Prdoucts_toCart.robot
# robot -d results/add-product-cart --reporttitle "My Report" --logtitle "Test Add Product to Cart" tests/02__Add_Prdoucts_toCart.robot
# robot -d results/add-product-cart -v BROWSER:ie tests/02__Add_Prdoucts_toCart.robot
# robot -d results/add-product-cart -v BROWSER:ff tests/02__Add_Prdoucts_toCart.robot

*** Test Cases ***
User Add Products To "My Cart"
    [Tags]  Add Cart To Product
    ecommerceApp."Add Cart" to product
    Sleep  3s
    ecommerceApp.Update "Quantity" Shopping Cart
    Sleep  3s
    ecommerceApp.Remove From Cart
