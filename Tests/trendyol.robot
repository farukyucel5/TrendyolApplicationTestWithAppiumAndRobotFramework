*** Settings ***
Resource    ../Resource/Keywords/homePage.robot
Library     AppiumLibrary

Test Teardown  Close Application

*** Test Cases ***
search_test
    initialize the application

    Open the application

    Type in the product you search and hit enter

    Verify the specified product is listed if yes add to cart and check





