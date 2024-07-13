#REGISTER ACCOUNT PAGE

*** Settings ***
Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             Collections
Resource            ../Utils/CommonMethods.robot
Resource            ../Utils/CommonVariables.robot

Test Setup        Open browser and go to url and maximize window
#Test Teardown     Close Browser Page

#EPIC 01 - Registration

*** Test Cases ***
QESDEMO-2752: Registration page: Unsuccessful registration - password less than 4 characters
    Navigating To Register Account Page
    ${firstName}   Generate Random String     6  [LETTERS]
    ${lastName}    Generate Random String     6  [LETTERS][NUMBERS]
    ${email}       Generate random email
    ${telephone}   Generate Random String  9  [NUMBERS]
    Enter Data With Given Password         ${firstName}  ${lastName}  ${email}  ${telephone}  ${password}
    Extra Click Element                    ${privacyPolicy}
    Extra Click Element                    ${continueButtonReg}
    Wait Until Element Contains            ${passwordErrorText}  ${tooShortPasswordError}

#
#Registration page: Unsuccessful registration - password less than 4 characters
#
#    ${firstName}   Generate Random String     6  [LETTERS]
#    ${lastName}    Generate Random String     6  [LETTERS][NUMBERS]
#    ${email}       Generate random email
#    ${telephone}   Generate Random String  9  [NUMBERS]
#    ${too short password}  Generate random string  3  [LETTERS][NUMBERS]
##    ${too long password}  Generate random string  22  [LETTERS][NUMBERS]
##    ${min length password}  Generate Random String  4  [LETTERS][NUMBERS]
#    Navigating To Register Account Page
#    Enter Data Except Password And Confirm Password Fields    ${firstName}   ${lastName}     ${email}     ${telephone}
#    Enter Data To The Input Field And Check Validation Message   ${password} ${too short password}  ${continueButtonReg} ${passwordErrorText}  ${tooShortPasswordError}
##    Enter Data To The Input Field And Check Validation Message   ${password} ${too long password}  ${continueButtonReg} ${passwordErrorText}  ${tooShortPasswordError}
#    Input Text    ${password}    ${firstName}  ${lastName}
#    Enter Data To The Input Field And Check Validation Message    ${passwordConfirm}    ${telephone}    ${confirmPasswordErrorText}    ${passwordsNotMatch}
##    Input Text    ${password}    ${min length password}
##    Enter Data To The Input Field And Check Validation Message    ${passwordConfirm}  ${min length password}    ${continueButtonReg} ${alert}    ${privacyPolicyNotChecked}