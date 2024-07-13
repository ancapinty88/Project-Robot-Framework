#MY ACCOUNT INFORMATION PAGE/ EDIT ACCOUNT PAGE

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
QESDEMO-2806: Edit my Account Information page: Error messages are displayed
    User Is Logged Into Account
    Extra Click Element    ${editAccountLink}
    Clear All Input Fields From Edit Account Page
    Extra Click Element    ${editContinueButton}
    Wait For Mandatory Fields Error Messages


