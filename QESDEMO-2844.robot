#SHOPPING CART PAGE

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
QESDEMO-2844: Shopping Cart page: Dropdown Button and navigation to "Checkout" page
    User Is Logged Into Account
    Add Items to Shopping Cart
    Check Shopping Cart Black Button Dropdown
    Check View Cart dropdown button
    Check Checkout dropdown button