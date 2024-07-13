#MY ACCOUNT INFORMATION PAGE/ EDIT ACCOUNT PAGE

*** Settings ***
Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             Collections
Resource            ../Utils/CommonVariables.robot
Resource            ../Utils/CommonMethods.robot


Test Setup        Open browser and go to url and maximize window
#Test Teardown     Close Browser Page

*** Variables ***
@{listEditableInformation}    First Name  Last Name  E-Mail  Telephone
${inputElements}              //fieldset/div/div/input
${editBackButton}              //*[@id="content"]/form/div/div[1]/a

*** Test Cases ***

QESDEMO-2804: My Account information page: Successfully editing personal details
    User Is Logged Into Account
    Check Edit Account Page
    ${email}  Generate Random String  8  [LOWER]
    ${name}  Generate Random String   8  [LOWER]
    ${phone}  Generate Random String  8  [NUMBERS]
    Enter data Input Fields and go Back
    Enter data Input Fields and check success message
    Enter my data Input Fields and check success message


    