#MY ACCOUNT PAGE

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
QESDEMO-2761: Pre-condition: User authorization to "My account" page
    Navigating To Returning Customer Login Page
    Check Returning Customer Section With Title And Input Fields
    Login Into My Account
    Click My Account Top Button And Choose An Option    ${logoutButton}



