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
QESDEMO-2854: Shopping Cart page: Delete button
    Added Item Shopping Cart
    Navigate to Shopping Cart page from navigation top menu
    Check Remove button functionality
    Page Should Contain    ${shopCartEmptyMessage}

