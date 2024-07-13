#MY ACCOUNT PAGE

*** Settings ***
Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             Collections
Resource            ../Utils/CommonVariables.robot
Resource            ../Utils/CommonMethods.robot


Test Setup        Open browser and go to url and maximize window
#Test Teardown     Close Browser Page

*** Test Cases ***
QESDEMO-2763-2764: My Account page: left and right side sub-menu preview
    User Is Logged Into Account
    Check Left Menu Titles
    Check If Sections Links Has Expected Name


