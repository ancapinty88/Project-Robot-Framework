#CHANGE PASSWORD PAGE

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

QESDEMO-2810: Change Password page: Mandatory information elements are present
    User Is Logged Into Account
    Go to Change Password page and check title
    Check Change Password labels
    Check Change Password input fields
    Check Change Password Back Button
    Check Change Password Continue Button
    Go back from Change Password page to My Account page



