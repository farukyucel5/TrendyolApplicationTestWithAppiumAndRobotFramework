*** Settings ***
Resource    ../Resource/Keywords/homePage.robot
Library     AppiumLibrary

*** Test Cases ***
search_test
    initialize_the_application
    Open_the_application
    Type_in_the_product_you_search_and_hit_enter
    Verify_that_products_listed_contain_the_keyword_passed_in





