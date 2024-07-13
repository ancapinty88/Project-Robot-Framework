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
QESDEMO-2824: My Wish List page: Add product to Wish List
    User Is Logged Into Account
    Check Home page and Featured section
    Check Wish List link item count is equal to zero
    Add Item to Wish List and check My Wish List page




    
