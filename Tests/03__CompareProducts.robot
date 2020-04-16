*** Settings ***
Documentation  User Can Compare Products
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/ecommerceApp.robot    # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
# robot -d results/compare-products tests/03__CompareProducts.robot
# robot -d results/compare-products --reporttitle "My Report" --logtitle "Compare Products" tests/03__CompareProducts.robot

*** Test Cases ***
User Can Compare Products
    [Tags]  Compare Products

    ecommerceApp.Add Compare for "Two Products"
    ecommerceApp.Verify Two Product Existing
    ecommerceApp.Delete Compare Product