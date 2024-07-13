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
QESDEMO-2841: My Wish List page: Removing item from My Wish List page
    User Is Logged Into Account
    Add Item to Wish List and navigate to My Wish List page
    Remove Item from My Wish List page