*** Settings ***
Documentation  user can add products my wishlist
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Data/InputData.robot
Resource  ../Resources/ecommerceApp.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results/AddToWishlist tests/04__addToWishlist.robot
# robot -d results/AddToWishlist -v BROWSER:ff tests/04__addToWishlist.robot
*** Test Cases ***
User Can Add Products To My Wishlist
    [Tags]  Add To Wishlist
    ecommerceApp.Typing "Search Product"
    ecommerceApp.View My "Wishlist"
    ecommerceApp.Update Quantity "My Wishlist"
    ecommerceApp.Remove From "Wishlist"


