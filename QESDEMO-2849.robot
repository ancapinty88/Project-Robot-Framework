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
QESDEMO-2849: Shopping Cart page: Check required buttons
    Added Item Shopping Cart
    Navigate to Shopping Cart page from navigation top menu
    Check Update Quantity Button Functionality
    Check Remove Button Functionality
    Check Continue Button Functionality
    Check Checkout Button Functionality

