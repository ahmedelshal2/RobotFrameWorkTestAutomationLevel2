*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${add_compare_firstProduct} =   xpath=//input[@class="button-2 add-to-compare-list-button"]
#${close_bar_notification} =     xpath=//span[@class="close"]
${product_comparison} =         xpath=//a[contains(text(),"product comparison")]
${CompareProduct_Table} =       xpath=//table[@class="compare-products-table"]
${CPU_Type_row} =               xpath=//table[@class="compare-products-table"]//tr[6]
${Name_product_row} =           xpath=//table[@class="compare-products-table"]//tr[6]
${Clear_List} =                 xpath=//a[contains(.,"Clear")]
*** Keywords ***

Add Compare first product
    Run Keyword And Continue On Failure  Click Button  ${add_compare_firstProduct}
    Sleep  3s

Add Compare Second product
    Run Keyword And Continue On Failure  Click Button  ${add_compare_firstProduct}
    Sleep  3s

Navigate To Compare Page
    Run Keyword And Continue On Failure  Click Link  ${product_comparison}
    Sleep  3s

Verify Compare Two Product
    Mouse Over  ${Name_product_row}
    Wait Until Page Contains  ${first_product_name}
    Sleep  2s
    Wait Until Page Contains  ${second_product_name}
    Sleep  2s
    Mouse Over  ${CPU_Type_row}
    Table Cell Should Contain  ${CompareProduct_Table}  6  2  Intel Core i7
    Sleep  2s
    Table Cell Should Contain  ${CompareProduct_Table}  6  3  Intel Core i5

Clear Compare Two Product
    Click Link  ${Clear_List}
    Sleep  2s
    Mouse Over  xpath=//div[@class="no-data"]
    Page Should Contain  You have no items to compare.  loglevel=TRACE