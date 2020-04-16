*** Settings ***
Resource  ./PO/HomePage.robot
Resource  ./PO/Register.robot
Resource  ./PO/Login.robot
Resource  ./PO/AddProductCart.robot
Resource  ./PO/CompareProductPO.robot
Resource  ./PO/AddToWishlistPO.robot
Resource  ./PO/checkoutPo.robot

*** Keywords ***
"Registeration" Page
    Common.Load
    HomePage.Verify Page Loaded
    HomePage.Register
    Register.Fill Personal Details
    Register.Verify Registration Completed and Continue
    HomePage.Logout
    HomePage.Verify Page Loaded

"Login" Page
    Common.Load
    HomePage.Click to Login Link
    Login.Enter your "Email"
    Login.Enter your "Password"
    Login.Submit
    Login.Verify Page Loaded
    HomePage.Logout
    HomePage.Verify Page Loaded

"Add Cart" to product
    Common.Load
    HomePage.Enter "First Product Name"
    Set Log Level  DEBUG
    Set Log Level  INFO
    AddProductCart.Add product to my cart
    Set Log Level  TRACE
    ${ReturnedInfo} =  AddProductCart.Verify Page Loaded
    Log  ${ReturnedInfo}

Update "Quantity" Shopping Cart
    AddProductCart.Update Quantity

Remove From Cart
    AddProductCart.remove

Add Compare for "Two Products"
    Common.Load
    HomePage.Enter "First Product Name"
    CompareProductPO.Add Compare first product
    HomePage.Enter "Second Product Name"
    CompareProductPO.Add Compare Second product
    CompareProductPO.Navigate To Compare Page

Verify Two Product Existing
    CompareProductPO.Verify Compare Two Product

Delete Compare Product
    CompareProductPO.Clear Compare Two Product

Typing "Search Product"
    Common.Load
    HomePage.Enter "First Product Name"

View My "Wishlist"
    AddToWishlistPO.Add Product to My Wishlist

Update Quantity "My Wishlist"
    AddToWishlistPO.Update Quantity

Remove From "Wishlist"
    AddToWishlistPO.Remove Wishlist

Click on Checkout
    checkoutPo.User Can Checkout

Fill Billing Address and Continue Shipping
    checkoutPo.Billing Address
    checkoutPo.Continue Shipping Addresss

Payment Method
    checkoutPo.Pay by credit or debit card