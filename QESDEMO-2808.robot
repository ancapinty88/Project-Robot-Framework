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

QESDEMO-2808: Change Password page: Error messages are displayed
    User Is Logged Into Account
    Extra Click Element    ${passwordChangeButton}
    Location Should Be     ${urlChangePasswordPage}
    Check title and subtitle in Change Password Page
    Enter My Data Into Password And Password Confirm
    Click Continue And Check The Error Messages

    