*** Settings ***
Variables       ../Locators/locators.py
Variables       ../TestData/testData.py
Library       ../../Library/ilkKutuphanem.py
Library     AppiumLibrary






*** Keywords ***
initialize_the_application
    open application    ${server}
    ...  platformName=${platformName}    platformVersion=${platformVersion}   deviceName=${deviceName}
    ...  automationName=${automationName}     appPackage=${appPackage}    appActivity=${appActivity}


Open_the_application
    wait until element is visible   ${sectionName}   30s
    click element  ${sectionName}
Type_in_the_product_you_search_and_hit_enter
    wait until element is visible    ${searchBar}    30s
    click element  ${searchBar}
    input text    ${searchBar}  kulaklık
    press keycode   84
    #it will hit the search button
Verify_that_products_listed_contain_the_keyword_passed_in
    wait until element is visible   ${viewElemet}   30s
    page should contain element   ${viewElemet}
    page should contain text    Kulaklık

































