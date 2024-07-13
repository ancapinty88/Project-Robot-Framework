#REGISTER ACCOUNT PAGE

*** Settings ***
Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             Collections
Resource            ../Utils/CommonVariables.robot
Resource            ../Utils/CommonMethods.robot


Test Setup        Open browser and go to url and maximize window
#Test Teardown     Close Browser Page

#EPIC 01 - Registration

*** Test Cases ***

QESDEMO-2744: Register Account page: validating the fields
#    Check Header Bar Icons
#    Check My Account Header Menu
    Navigating To Register Account Page
    Check Text Field List
    Check Input Field List
    Element Should Be Visible             ${privacyPolicy}
    Check Text Of Elements                ${subscribe Yes/No}     @{newsletter radio buttons}
    Create account successfully



