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
QESDEMO-2805: My Account Information page: E-mail format check
    User Is Logged Into Account
    Extra Click Element    ${editAccountLink}
    Check Email Input Field Validation
    Location Should Be     ${urlMyAccountPage}
    Extra Click Element    ${editAccountLink}
    Enter Data To The Input Field And Check Validation Message    ${editEmailInput}  ${editGivenEmail} ${editContinueButton}  ${successUpdatePass}  ${updateSuccessMessage}
    Location Should Be     ${urlMyAccountPage}



