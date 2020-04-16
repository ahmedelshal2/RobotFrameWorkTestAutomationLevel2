*** Settings ***
Documentation  User Can Register and Login
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/ecommerceApp.robot    # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
# robot -d results/register-login tests/01__Register_Login_Page.robot
# robot -d results/register-login --reporttitle "Test Registeration and Login Page" --logtitle "Registeration and Login Page" tests/01__Register_Login_Page.robot

*** Test Cases ***

User Can "Register"
    [Tags]  Register
    ecommerceApp."Registeration" Page

User Can "Login"
    [Tags]  Login
    ecommerceApp."Login" Page
