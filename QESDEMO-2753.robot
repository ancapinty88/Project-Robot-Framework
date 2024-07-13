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
QESDEMO-2753: Create an account with an already existing email
#Create an account - not a random e-mail and Logout of created account
    Navigating To Register Account Page
    Enter My Data On Register Account Page
    Wait Until Element Contains    ${success message}    Your Account Has Been Created!
    Extra Click Element   ${myAccountMenu}
    Click My Account Top Button And Choose An Option     ${logoutButton}
    Wait Until Element Contains    ${logout confirmation text}    Account Logout

#Create an account with the same credentials
    Click My Account Top Button And Choose An Option      ${registerOption}
    Enter Existing Data On Register Account Page
    Click Element                                         ${privacyPolicy}
    Click Button                                          ${continueButton}
    Wait Until Element Contains           ${alert existing account}     Warning: E-Mail Address is already registered!


