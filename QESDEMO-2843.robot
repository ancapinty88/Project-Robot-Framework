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
QESDEMO-2843: Shopping Cart page: Successfully add and remove item from Shopping Cart
    User Is Logged Into Account
    Add Items To Shopping Cart
    Remove Item from Shopping Cart
