#MY WISH LIST PAGE

*** Settings ***
Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             Collections
Resource            ../Utils/CommonMethods.robot
Resource            ../Utils/CommonVariables.robot

Test Setup        Open browser and go to url and maximize window
#Test Teardown     Close Browser Page

*** Test Cases ***
My Wish List page: Add product from Wish List to Shopping Cart
    User Is Logged Into Account
    Add Item to Wish List and navigate to My Wish List page
    Check Shopping Cart is empty
    Add to Cart Item from Wish List and check Shopping Cart page

