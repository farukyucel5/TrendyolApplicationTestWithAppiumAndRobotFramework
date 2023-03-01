*** Settings ***
Variables       ../Locators/locators.py
Variables       ../TestData/testData.py
Library     AppiumLibrary
Library     BuiltIn




*** Keywords ***
initialize the application
    open application    ${server}
    ...  platformName=${platformName}    platformVersion=${platformVersion}   deviceName=${deviceName}
    ...  automationName=${automationName}     appPackage=${appPackage}    appActivity=${appActivity}


Open the application
    wait until element is visible   ${sectionName}   30s
    click element  ${sectionName}
Type in the product you search and hit enter
    wait until element is visible    ${searchBar}    30s
    click element  ${searchBar}
    input text    ${searchBar}  kulaklık
    press keycode   84
    #it will hit the search button
Verify the specified product is listed if yes add to cart and check
    wait until element is visible   ${viewElemet}   30s
    ${status}      run keyword and return status    page should not contain element    ${scrollElement}
    run keyword if    ${status} == True              SwipeDown
    run keyword if    ${status} == False               click element   ${scrollElement}


SwipeDown
    swipe  514    600   514   200   1000
    swipe  514    600   514   200   1000
    ${status}      run keyword and return status    page should not contain element    ${scrollElement}
    run keyword if    ${status} == False               addToCartAndVerifySuccess
    run keyword if    ${status} == True                Verify_that_products_listed_contain_the_keyword_passed_in


addToCartAndVerifySuccess
    click element   ${scrollElement}
    wait until element is visible  ${addToCart}   30s
    click element   ${addToCart}
    wait until element is visible  ${navigateToBasket}    30s
    click element  ${navigateToBasket}
    wait until element is visible       ${popUp}    30s
    ${status}      run keyword and return status      page should contain element       ${popUp}
    run keyword if    ${status} == True             click element    ${popUp}
    run keyword if    ${status} == False            page should contain element     ${scrollElement}
    page should contain element     ${scrollElement}






































