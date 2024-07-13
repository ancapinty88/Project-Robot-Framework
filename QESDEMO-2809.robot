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

QESDEMO-2809: Change Password page: Successfully password changed
    User Is Logged Into Account
    Go to Change Password page and check title
    Enter New Password And Confirm Password
    Click Continue And Check The Success Message
    Extra Click Element     ${passwordChangeButton}
    Enter Initial Password And Confirm Password
    Click Continue And Check The Success Message
    Location Should Be      ${urlMyAccountPage}


