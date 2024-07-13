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
QESDEMO-2847: Shopping Cart page: Navigation to page and verify product description table fields
    Added Items Shopping Cart
    Navigate to Shopping Cart page from navigation top menu
    Navigate to Shopping Cart page from black button link
    Check product description table fields

