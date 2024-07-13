#CHECKOUT PAGE

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
QESDEMO-2879: Checkout page: Unsuccessful Checkout - No Payment options are available
    Navigate to Checkout page from Shopping Cart Dropdown button
    Extra Click Element    ${sectionBillingDetails}
    Extra Click Element    ${newAddressBillingDetails}
    Input data in Billing Details form
    Check Payment Method form
    Check error message without check Terms & Conditions checkbox
    Check error message after check Terms & Conditions checkbox
