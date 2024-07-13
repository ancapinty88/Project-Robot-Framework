#REGISTER ACCOUNT PAGE

*** Settings ***
Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Resource            ../Utils/CommonVariables.robot
Resource            ../Utils/CommonMethods.robot


Test Setup        Open browser and go to url and maximize window
Test Teardown     Close Browser Page

#EPIC 01 - Registration
*** Test Cases ***
QESDEMO-2743: Pre-condition: User is redirected to "Register Account" page
    Element Text Should Be    ${titleTDS}     Testing Demo Shop
    Check Header Bar Icons
    Extra Click Element       ${registerOption}
    Location Should Be        ${urlRegPage}
    Element Text Should Be    ${titleRegAcc}    Register Account


    

