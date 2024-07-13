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
QESDEMO-2823: My Wish List page: Table fields visibility
    User is logged into account
    Add Item to Wish List and navigate to My Wish List page
    Check table fields presence and information about product
    Check Action table column if has two buttons




