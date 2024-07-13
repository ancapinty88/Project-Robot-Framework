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

*** Test Cases ***
QESDEMO-2742: Registration page: Unsuccessful registration - empty mandatory fields and Checkbox is ticked off
   Navigating To Register Account Page
   Empty Input Fields             ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
   Extra Click Element            ${continueButton}
   Page Should Contain            ${privacyPolicyNotChecked}     15
   Warning Messages In Registration Form Page    


