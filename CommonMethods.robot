*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             Collections
Library             String
Resource            ../Utils/CommonVariables.robot

*** Keywords ***
DemoShopActions
    Extra click element
    Extra input text

Extra click element
    [Arguments]   ${var1}
    Wait Until Element Is Visible   ${var1}      40
    Click Element    ${var1}

Extra input text
    [Arguments]   ${var1}     ${var2}
    Wait Until Element Is Visible   ${var1}
    Input text    ${var1}     ${var2}


Open browser and go to url and maximize window
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

<<<<<<< HEAD
Log out and close browser
    #Logout
    Close Browser
    #Run Keyword
=======
Close browser page
    #Logout
    Close Browser
    #Run Keyword

#Registration Account Page  ------------->

Navigating to Register Account page
    Extra Click Element        ${myAccountMenu}
    Extra Click Element        ${registerOption}

Click My Account top button and choose an option
    [Arguments]  ${choice}
    Click Element    ${myAccountMenu}
    Click Element    ${choice}


Create account
    [Arguments]   ${firstName}  ${lastName}  ${email}  ${telephone}  ${password}   ${privacyPolicy}   ${continueButton}
    Navigating To Register Account Page
    Entering Data On Register Account Page      ${firstName}  ${lastName}  ${email}  ${telephone}  ${password}   ${password}
    Extra Click Element                         ${privacyPolicy}
    Extra Click Element                         ${continueButton}


Create account successfully
    ${email}  Generate Random String  8  [LOWER]
    ${name}  Generate Random String  8  [LOWER]
    ${lastName}  Generate Random String  8  [LOWER]
    ${password}  Generate Random String  8  [LOWER]
    ${phone}  Generate Random String  8  [NUMBERS]
    Create account     ${name}  ${lastName}  ${email}@xmail.com  ${phone}  ${password}   ${password}   ${continueButton}
    Wait Until Element Contains    ${success message}    Your Account Has Been Created!  40


#random data
Entering data on Register Account page
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${telephone}  ${password}  ${password}
    Input Text    //*[@id="input-firstname"]   ${firstName}
    Input Text    //*[@id="input-lastname"]    ${lastName}
    Input Text    //*[@id="input-password"]    ${password}
    Input Text    //*[@id="input-confirm"]     ${password}
    Input Text    //*[@id="input-email"]       ${email}
    Input Text    //*[@id="input-telephone"]   ${telephone}

#my data
Enter my data on Register Account page
    Input Text        //*[@id="input-firstname"]      ${userName}
    Input Text        //*[@id="input-lastname"]       ${userSurname}
    ${givenEmail} =    Set Variable                   ${userName}.${userSurname}@xmail.com
    Input Text        //*[@id="input-email"]          ${givenEmail}
    Input Text        //*[@id="input-telephone"]      09876543210
    Input Password    //*[@id="input-password"]       ${userPassword}
    Input Password    //*[@id="input-confirm"]        ${userPassword}

Enter existing data on Register Account page
    Input Text        //*[@id="input-firstname"]      ${userName}
    Input Text        //*[@id="input-lastname"]       ${userSurname}
    Input Text        //*[@id="input-email"]          Billy.Jean@xmail.com
    Input Text        //*[@id="input-telephone"]      09876543210
    Input Password    //*[@id="input-password"]       ${userPassword}
    Input Password    //*[@id="input-confirm"]        ${userPassword}

Check text of elements
    [Arguments]  ${web elements}  ${visible text}
    ${newsletter}  Get WebElements     ${web elements}

      FOR    ${element}    IN    @{newsletter}
             ${text}  Get Text    ${element}
            List Should Contain Value    ${visible text}   ${text}
            Log    ${text}
      END


Check Text Field List
    Element Text Should Be           ${firstName}           First Name
    Element Text Should Be           ${lastName}            Last Name
    Element Text Should Be           ${email}               E-mail
    Element Text Should Be           ${telephone}           Telephone
    Element Text Should Be           ${password}            Password
    Element Text Should Be           ${passwordConfirm}     Password Confirm

Check Input Field List
    Element Attribute Value Should Be    ${firstName}        placeholder    First Name
    Element Attribute Value Should Be    ${lastName}         placeholder    Last Name
    Element Attribute Value Should Be    ${email}            placeholder    E-mail
    Element Attribute Value Should Be    ${telephone}        placeholder    Telephone
    Element Attribute Value Should Be    ${password}         placeholder    Password 
    Element Attribute Value Should Be    ${passwordConfirm}  placeholder    Password Confirm
    
    
Check My account header menu
    Extra Click Element       ${myAccountMenu}
    Element Text Should Be    ${registerOption}   Register
    Element Text Should Be    ${loginOption}      Login

Check header bar icons
#    ${actualText} =               Get Text    ${currencyIcon}
#    ${trimmedActualText} =        Remove String    ${actualText}    \s   # Removes leading and trailing spaces
    Element Should Contain        ${currencyIcon}       $ Currency
    Element Should Be Visible     ${currencyDropdown}
    Click Button                  ${currencyDropdown}
    Element Should Contain        ${euro}                € Euro
    Element Text Should Be        ${poundSterling}       £ Pound Sterling
    Element Text Should Be        ${usDollar}            $ US Dollar
    Element Text Should Be        ${phoneIcon}           123456789
    Extra Click Element           ${myAccountMenu}
    Element Text Should Be        ${loginOption}         Login
    Element Text Should Be        ${registerOption}      Register
    Element Text Should Be        ${wishListIcon}        Wish List
    Element Text Should Be        ${shoppingCartIcon}    Shopping Cart
    Element Text Should Be        ${checkoutIcon}        Checkout

Generate random email
    ${randomString}  Generate Random String  8  [LETTERS][NUMBERS]
    ${email}  Set Variable  ${randomString}@xmail.com
    RETURN   ${email}


Enter data except password and confirm password fields
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${telephone}
    Input Text    ${firstNameInput}   ${firstName}
    Input Text    ${lastNameInput}    ${lastName}
    Input Text    ${emailInput}       ${email}
    Input Text    ${telephoneInput}   ${telephone}

Enter data to the input field and check validation message
    [Arguments]  ${input field}  ${text}  ${submitButton}  ${error message locator}  ${expected error message}
    Input Text  ${input field}  ${text}
    Extra Click Element      ${submitButton}
    Get Element Label And Compare        and compare if it matches expected one    ${error message locator}  ${expected error message}

Get Element Label And Compare
    [Arguments]    ${webElementPath}    ${expectedArgument}
    ${labelElement}    Get WebElement    ${webElementPath}
    ${actualLabel}    Get Text    ${labelElement}
    Should Be Equal As Strings    ${actualLabel.strip()}    ${expectedArgument}

Enter data with given password
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${telephone}  ${password}
    Input Text    //*[@id="input-firstname"]   ${firstName}
    Input Text    //*[@id="input-lastname"]    ${lastName}
    ${password} =        Set Variable     pin
    Input Text    //*[@id="input-password"]    ${password}
#    ${givenPasswordConfirm} =  Set Variable    pin
    Input Text    //*[@id="input-confirm"]     ${password}
    Input Text    //*[@id="input-email"]       ${email}
    Input Text    //*[@id="input-telephone"]   ${telephone}


#leave empty input fields
Empty input fields
    [Arguments]  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
    Input Text    //*[@id="input-firstname"]   ${EMPTY}
    Input Text    //*[@id="input-lastname"]    ${EMPTY}
    Input Text    //*[@id="input-password"]    ${EMPTY}
    Input Text    //*[@id="input-confirm"]     ${EMPTY}
    Input Text    //*[@id="input-email"]       ${EMPTY}
    Input Text    //*[@id="input-telephone"]   ${EMPTY}
    
Warning messages in Registration form page
    Page Should Contain   ${firstNameWarning}
    Page Should Contain   ${lastNameWarning}
    Page Should Contain   ${emailWarning}
    Page Should Contain   ${telephoneWarning}
    Page Should Contain   ${passwordWarning}

#Registration Account Page  <-------------

#------------------------------------------------------------------------------------------------------------

#Login and My Account Page -------------->

Navigating to Returning Customer Login page
    Extra Click Element       ${myAccountMenu}
    Extra Click Element       ${loginOption}

Check Returning Customer section with title and input fields
    Element Text Should Be      ${returningCustomerTitle}     Returning Customer
    Element Should Be Visible   ${returningCustomerSection}
    Element Text Should Be      ${emailAddressLogin}  E-Mail Address
    Element Attribute Value Should Be    ${emailAddressLoginInput}        placeholder    E-Mail Address
    Element Text Should Be    ${passwordLogin}      Password
    Element Attribute Value Should Be    ${passwordLoginInput}            placeholder    Password

Login into My Account
    Input Text    ${emailAddressLoginInput}     ${loginEmail}
    Input Text    ${passwordLoginInput}         ${loginPassword}
    Extra Click Element        ${loginButton}
    Location Should Be         ${urlMyAccountPage}
    Element Text Should Be     ${titleMyAccount}     My Account

Check Left menu titles
    Page Should Contain    My Account
    Page Should Contain    My Orders
    Page Should Contain    My Affiliate Account
    Page Should Contain    Newsletter

Check if page items labels has the same values as expected
    [Arguments]  ${web element list}  ${expected list names}
    ${links}  Get WebElements    ${web element list}
    ${list link}  Create List
    FOR    ${label}   IN    @{links}
         ${link_Text}  Get Text     ${label}
          Append To List   ${list link}   ${link_Text}
    END
    Lists Should Be Equal    ${list link}    ${expected list names}
    Log    ${list link}
    Log    ${expected list names}

Check if sections links has expected name
    Check if page items labels has the same values as expected  ${leftMenu}   @{listLeftMenu}
    Check If Page Items Labels Has The Same Values As Expected  ${rightMenu}  @{listRightMenu}

#Login and My Account Page <-------------
#------------------------------------------------------------------------------------------------------------
#Edit account information page -------------->

Enter data input fields
    [Arguments]  ${data1}  ${data2}  ${data3}  ${dataText1}  ${dataText2}  ${dataText3}
    Input Text    ${data1}    ${dataText1}
    Input Text    ${data2}    ${dataText2}
    Input Text    ${data3}    ${dataText3}

Check elements in list
    [Arguments]  ${web elements}  ${list input fields}  ${attribute of field}
    ${elements in xpath}  Get WebElements    ${web elements}

    FOR    ${element}    IN    @{elements in xpath}
           ${attribute}  Get Element Attribute  ${element}      ${attribute of field}
           List Should Contain Value    ${list input fields}    ${attribute}
           Log  ${attribute}
           Log  ${list input fields}
    END

Enter my data input to fields
       Input Text    //*[@id="input-firstname"]    manual
       Input Text    //*[@id="input-lastname"]     testing
       Input Text    //*[@id="input-email"]        mt@xmail.com
       Input Text    //*[@id="input-telephone"]    +371 22334455

Enter email address and check tooltip message
    [Arguments]  ${input field}  ${text}  ${submit button}  ${expected message}
    Input Text  ${input field}  ${text}
    Extra Click Element    ${submit button}
    Wait Until Page Contains    text
    ${validation tooltip message}  Get Element Attribute    ${input field}  validationMessage
    Should Be Equal As Strings    ${validation tooltip message.strip()}  ${expected message}

Check email input field validation
    Enter data to the input field and check validation message   ${editEmailInput}     ank@ank    ${editContinueButton}    ${emailValidationMessage}     ${invalidEmailMessage}
    Enter email address and check tooltip message  ${editEmailInput}    ${updatePass1}     ${editContinueButton}    ${errorUpdatePass1}
    Enter email address and check tooltip message  ${editEmailInput}    ${updatePass2}     ${editContinueButton}    ${errorUpdatePass2}
    Enter email address and check tooltip message  ${editEmailInput}    ${updatePass3}     ${editContinueButton}    ${successUpdatePass}

Clear all input fields from Edit Account Page
    Clear Element Text    ${editFirstNameInput}
    Clear Element Text    ${editLastNameInput}
    Clear Element Text    ${editEmailInput}
    Clear Element Text    ${editTelephoneInput}

Wait for mandatory fields error messages
    Wait Until Element Contains    ${firstNameValidationMessage}    ${invalidFirstNameMessage} 
    Wait Until Element Contains    ${lastNameValidationMessage}     ${invalidLastNameMessage}
    Wait Until Element Contains    ${emailValidationMessage}        ${invalidEmailMessage}
    Wait Until Element Contains    ${telephoneValidationMessage}    ${invalidTelephoneMessage}

Check Edit Account Page
    Extra Click Element           ${editAccountLink}
    Check elements in list        ${inputElements}     @{listEditableInformation}     ${placeholder}
    Element Should Be Visible     ${editContinueButton}
    Element Should Be Visible     ${editBackButton}

Enter data Input Fields and go Back
    Enter Data Input Fields    ${editFirstNameInput} ${editLastNameInput} ${editEmailInput}  ${name}  ${name} ${email}@xmail.com
    Input Text                       ${editTelephoneInput} ${phone}
    Extra Click Element              ${editBackButton}

Enter data Input Fields and check success message
    Extra Click Element              ${editAccountLink}
    Enter Data Input Fields    ${editFirstNameInput} ${editLastNameInput} ${editEmailInput}  ${name}  ${name} ${email}@xmail.com
    Input Text                       ${editTelephoneInput} ${phone}
    Extra Click Element              ${editContinueButton}
    Wait Until Element Is Visible    ${editSuccessMessage}  30
    Page Should Contain              ${updateSuccessMessage}

Enter my data Input Fields and check success message
    Extra Click Element              ${editAccountLink}
    Enter My Data Input To Fields
    Extra Click Element              ${editContinueButton}
    Wait Until Element Is Visible    ${editSuccessMessage}  30
    Page Should Contain              ${updateSuccessMessage}

#Edit account information page <--------------

#------------------------------------------------------------------------------------------------------------

#Change Password page -------------->

Check Change Password labels
    Element Text Should Be           ${changePasswordBothLabels}        @{expectedBothLabels}
#    Check if page items labels has the same values as expected    ${changePasswordBothLabels}  @{expectedBothLabels}

Check Change Password input fields
     Element Attribute Value Should Be   ${changePasswordBothFields}         placeholder    @{expectedBothFields}
#    Check Input Fields Has The Right Placeholders    ${changePasswordBothFields}  @{expectedBothFields}

#Check input fields has the right placeholders
#    [Arguments]  ${input placeholders}  ${expected}
#    ${placeholders_texts}  Get WebElements   ${input placeholders}
#    ${placeholders_text_list}  Create List
#     FOR    ${input_placeholder}    IN    @{placeholders_texts}
#         ${placeholder}  Get Element Attribute    ${input_placeholder}  placeholder
#         Append To List   ${placeholders_text_list}   ${placeholder}
#     END
#     Lists Should Be Equal    ${placeholders_text_list}    ${expected}

Check Change Password Continue Button
    Check If Input Type Matches Expected Type    ${changePasswordContinueButton}  ${expectedContinueButton}

Check Change Password Back Button
    Page Should Contain Element    ${changePasswordBackButton}

Check if input type matches expected type
    [Arguments]  ${web element path}  ${expected argument}
    ${input type}  Get Element Attribute    ${web element path}    type
    Should Be Equal As Strings    ${input type}    ${expected argument}
    
Check if input fields has expected value
    [Arguments]     ${input field}  ${expected value}
    ${input text}  Get Element Attribute    ${input field}    value
    Should Be Equal As Strings    ${input text}  ${expected value}

    

Check title and subtitle in Change Password Page
    Page Should Contain    Change Password
    Page Should Contain    Your Password

Enter my data into Password and Password Confirm
    Input Text    ${changePasswordInput}           P4
    Input Text    ${changeConfirmPasswordInput}    P40

Enter new Password and Confirm Password
    Input Text    ${changePasswordInput}           P400
    Input Text    ${changeConfirmPasswordInput}    P400

Enter initial Password and Confirm Password
    Input Text    ${changePasswordInput}           manual12345
    Input Text    ${changeConfirmPasswordInput}    manual12345

Click Continue and check the error messages
    Click Button   ${changePasswordContinueButton}
    Wait Until Element Is Visible    ${errorPasswordTooShort}   20
    Wait Until Element Is Visible    ${errorPasswordDoNotMatch}  20
    Page Should Contain    Password must be between 4 and 20 characters!
    Page Should Contain    Password confirmation does not match password!

Click Continue and check the success message
    Click Button   ${changePasswordContinueButton}
    Wait Until Element Is Visible    ${successMessagePassword}  20
    Page Should Contain    Success: Your password has been successfully updated.

Go to Change Password page and check title
    Extra Click Element     ${passwordChangeButton}
    Location Should Be      ${urlChangePasswordPage}
    Check title and subtitle in Change Password Page

Go back from Change Password page to My Account page
    Extra Click Element       ${changePasswordBackButton}
    Element Text Should Be    ${titleMyAccount}  My Account
    Location Should Be        ${urlMyAccountPage}


#Change Password page <--------------

#------------------------------------------------------------------------------------------------------------
#My Wish List page -------------->

Check Home page and Featured section
    Extra Click Element            ${pageLogo}
    Location Should Be             ${urlHomePage}
    Title Should Be                ${titleTDS}
    Page Should Contain Element    ${titleFeaturedSection}

Check Wish List link item count is equal to zero
    Get Element Label And Compare    ${countWishListInitial}        ${countWishListExpected}
   
Check Wish List link item count is equal to 1     
    Get Element Label And Compare equal strings    ${countWishListInitial}    ${countMacBookExpected}

Add Item to Wish List and check My Wish List page
    Extra Click Element            ${pageLogo}
    Extra Click Element            ${heartAddWishListButton}
    Wait Until Element Contains    ${successAddWishList}     Success: You have added MacBook to your wish list!
    Extra Click Element            ${wishListButtonLink}
    Location Should Be             ${urlWishListPage}
    Page Should Contain Element    ${macBookItem}
    Check Wish List Link Item Count Is Equal To 1
    Extra Click Element            ${removeItemFromTable}

Add Item to Wish List
    Extra Click Element            ${pageLogo}
    Extra Click Element            ${heartAddWishListButton}
    Wait Until Element Contains    ${successAddWishList}     Success: You have added MacBook to your wish list!
    Extra Click Element            ${wishListButtonLink}
    Location Should Be             ${urlWishListPage}
    Page Should Contain Element    ${macBookItem}

Get Element Label And Compare equal strings
    [Arguments]    ${webElementPath}    ${expectedArgument}
    ${labelElement}    Get WebElement    ${webElementPath}
    ${actualLabel}    Get Text    ${labelElement}
    Should Be Equal As Strings  ${actualLabel.strip()}    ${expectedArgument}
    
    
Click Continue and go to My Account page
    Extra Click Element            ${continueButtonWishList}
    Location Should Be             ${urlMyAccountPage}
    Element Text Should Be         ${titleMyAccountPage}    My Account

Check Wish List visibility and go to Wish List page
    Page Should Contain Element    ${wishListButtonLink}
    Page Should Contain Element    ${heartIconWishList}
    Extra Click Element            ${wishListButtonLink}
    Location Should Be             ${urlWishListPage}
    Element Text Should Be         ${titleWishListPage}     My Wish List

Add Item to Wish List and navigate to My Wish List page
    Extra Click Element            ${pageLogo}
    Extra Click Element            ${heartAddWishListButton}
    Wait Until Element Contains    ${successAddWishList}     Success: You have added MacBook to your wish list!
    Extra Click Element            ${wishListButtonLink}
    Location Should Be             ${urlWishListPage}
    Page Should Contain            MacBook

User is logged into account
    Navigating To Returning Customer Login Page
    Login Into My Account

Check table fields presence and information about product
    Check if page items labels has the same values as expected  ${menuFieldsWishList}  @{menuFieldsNameWishList}

Check Action table column if has two buttons
    Element Should Be Visible    ${AddToCartButton}
    Element Should Be Visible    ${removeItemFromTable}

Navigate to Wish List from navigation top menu
    Extra Click Element    ${wishListButtonLink}
    Title Should Be        ${titleWishListPage}
    Location Should Be     ${urlWishListPage} 
    Extra Click Element    ${myAccountRightMenu} 
    Title Should Be        ${titleMyAccountPage}
    Location Should Be     ${urlMyAccountPage}
    Extra Click Element    ${wishListRightMenu} 
    Title Should Be        ${titleWishListPage}
    Location Should Be     ${urlWishListPage}

Navigate to Wish List from Modify-your-Wish-List button
    Extra Click Element    ${myAccountRightMenu}
    Title Should Be        ${titleMyAccountPage}
    Location Should Be     ${urlMyAccountPage}
    Extra Click Element    ${modifyWishListLeftMenu}
    Title Should Be        ${titleWishListPage}
    Location Should Be     ${urlWishListPage}

Check Shopping Cart is empty
    Extra Click Element            ${shoppingCartButtonLink}
    Title Should Be                ${titleShoppingCart}
    Location Should Be             ${urlShoppingCart}
    Page Should Contain Element    ${shoppingCartEmpty}  

Add to Cart Item from Wish List and check Shopping Cart page
    Extra Click Element            ${wishListButtonLink}
    Title Should Be                ${titleWishListPage}
    Location Should Be             ${urlWishListPage}
    Extra Click Element            ${AddToCartButton}
    Wait Until Element Contains    ${successMessageAddToCart}     Success: You have added MacBook to your shopping cart!
    Extra Click Element            ${shoppingCartButtonLink}
    Title Should Be                ${titleShoppingCart}
    Location Should Be             ${urlShoppingCart}
    Title Should Be                ${newTitleShoppingCart}
    Page Should Contain            MacBook
#    Element Should Be Visible      ${macBookItem}

Remove Item from My Wish List page
    Extra Click Element    ${removeItemFromTable}
    Page Should Contain    ${successMessageRemoveItem}

#My Wish List page <--------------

#------------------------------------------------------------------------------------------------------------

#Shopping Cart page -------------->

Add Items to Shopping Cart
    Extra Click Element            ${pageLogo}
    Extra Click Element            ${macBookAddToCart}
    Page Should Contain            ${successMessageMacBook}
    Extra Click Element            ${iPhoneItem}
    Extra Click Element            ${iPhoneAddToCart}
    Page Should Contain            ${successMessageIPhone}

Add Item to Shopping Cart
    Extra Click Element            ${pageLogo}
    Extra Click Element            ${macBookAddToCart}
    Page Should Contain            ${successMessageMacBook}

Remove Item from Shopping Cart
    Extra Click Element            ${shoppingCartBlackButton}
    Page Should Contain            ${twoItemsTotal}
    Extra Click Element            ${removeIPhone}

Check Shopping Cart Black Button Dropdown
    Extra Click Element              ${shoppingCartBlackButton}
    Wait Until Element Is Visible    ${iPhoneDropdownFields}
    Wait Until Element Is Visible    ${macBookDropdownFields}
    Wait Until Element Is Visible    ${priceTableDropdown}
    Get Element Label And Compare    ${viewCartDropdownButton}  ${viewCartText} 
    Get Element Label And Compare    ${checkoutDropdownButton}  ${checkoutText}

Check View Cart dropdown button
    Extra Click Element               ${viewCartDropdownButton}
    Page Should Contain Element       ${tableShoppingCart}
    Title Should Be                   ${titleShoppingCart}
    Location Should Be                ${urlShoppingCart}

Check Checkout dropdown button
    Extra Click Element    ${shoppingCartBlackButton}
    Extra Click Element    ${removeIPhone}
    Extra Click Element    ${shoppingCartBlackButton}
    Extra Click Element    ${checkoutDropdownButton}
    Title Should Be        ${titleCheckoutPage}
    Location Should Be     ${urlCheckoutPage}
    Page Should Contain Element    ${sectionCheckoutOptions}
    Page Should Contain Element    ${sectionBillingDetails}
    Page Should Contain Element    ${sectionPaymentMethod}
    Page Should Contain Element    ${sectionConfirmOrder}

Added Items Shopping Cart
    User Is Logged Into Account
    Add Items To Shopping Cart

Added Item Shopping Cart
    User Is Logged Into Account
    Add Item to Shopping Cart

Navigate to Shopping Cart page from navigation top menu
    Extra Click Element    ${shoppingCartButtonLink}
    Location Should Be     ${urlShoppingCart} 
    Title Should Be        ${titleShoppingCart}

Navigate to Shopping Cart page from black button link
    Check Home page and Featured section
    Check Shopping Cart Black Button Dropdown
    Check View Cart dropdown button

Check product description table fields
    Check if page items labels has the same values as expected    ${tableFieldsShoppingCart}   @{tableFieldsTitleShoppingCart}
    Element Should Be Visible    ${updateButtonShopCart}
    Element Should Be Visible    ${removeButtonShopCart}
    Element Should Be Visible    ${continueButtonShopCart}
    Element Should Be Visible    ${checkoutButtonShopCart}

Check Update quantity button functionality
   Input Text                                 ${updateInputField}  ${newQuantityValue}
   Extra Click Element                        ${updateButtonShopCart}
   Page Should Contain                        ${updateSuccessMessage}
   Check if input fields has expected value   ${updateInputField}  ${newQuantityValue}

Check Remove button functionality
    Extra Click Element    ${removeButtonShopCart}

Check Continue Button Functionality
    Extra Click Element     ${continueButtonShopCart}
    Check Home page and Featured section

Check Checkout Button Functionality
    Add Item to Shopping Cart
    Navigate to Shopping Cart page from navigation top menu
    Navigate to Checkout page from Shopping Cart page

Navigate to Checkout page from Shopping Cart page
    Extra Click Element    ${checkoutButtonShopCart}  
    Location Should Be     ${urlCheckoutPage}
    Title Should Be        ${titleCheckoutPage}
    Page Should Contain Element    ${sectionCheckoutOptions}
    Page Should Contain Element    ${sectionBillingDetails}
    Page Should Contain Element    ${sectionPaymentMethod}
    Page Should Contain Element    ${sectionConfirmOrder}

Check Update Increase Quantity
    Added Item Shopping Cart
    Navigate to Shopping Cart page from navigation top menu
    Check Update Quantity Button Functionality

Check Update Decrease Quantity
   Input Text                                 ${updateInputField}  ${initialQuantityValue}
   Extra Click Element                        ${updateButtonShopCart}
   Page Should Contain                        ${updateSuccessMessage}
   Check if input fields has expected value   ${updateInputField}  ${initialQuantityValue}

Add Out of Stock Item
    Extra Click Element            ${iPhoneItem}
    Extra Click Element            ${iPhoneAddToCart}
    Page Should Contain            ${successMessageIPhone}

Check Out of Stock *** Symbol
    Check If Page Items Labels Has The Same Values As Expected    ${iPhoneFieldTable}  ${outOfStockIphone}

Remove Out of Stock Item
    Extra Click Element    ${removeButtonShopCart}

#Shopping Cart page <--------------
#------------------------------------------------------------------------------------------------------------

#Checkout page -------------->
Navigate to Checkout page from Shopping Cart Dropdown button
    User Is Logged Into Account
    Add Items to Shopping Cart
    Check Shopping Cart Black Button Dropdown
    Check View Cart dropdown button
    Check Checkout dropdown button

Check input fields from Billing Details form
    Check elements in list       ${inputFieldsBillingDetails}   ${fieldsTitleBillingDetails}    ${placeholder}
    Extra Click Element          ${countryMenuOptions}
    Extra Click Element          ${countryPleaseSelect}
    Extra Click Element          ${regionMenuOptions}
    Extra Click Element          ${regionPleaseSelect}

Check error messages from Billing Details form
   Page Should Contain     ${errorFirstNameBD}
   Page Should Contain     ${errorLastNameBD}
   Page Should Contain     ${errorAddressBD}
   Page Should Contain     ${errorCityBD}
   Page Should Contain     ${errorCountryBD}
   Page Should Contain     ${errorRegionBD}

Input data in Billing Details form
    ${name}  Generate Random String  6  [LETTERS]
    ${number}  Generate Random String  4  [NUMBERS]
    ${random string with numbers}  Generate Random String  6  [LETTERS][NUMBERS]
    Input Text    ${inputFieldsBD}/div[1]/div/input    ${name}
    Input Text    ${inputFieldsBD}/div[2]/div/input    ${name}
    Input Text    ${inputFieldsBD}/div[3]/div/input    ${name}
    Input Text    ${inputFieldsBD}/div[4]/div/input    ${random string with numbers}
    Input Text    ${inputFieldsBD}/div[5]/div/input    ${random string with numbers}
    Input Text    ${inputFieldsBD}/div[6]/div/input    ${name}
    Input Text    ${inputFieldsBD}/div[7]/div/input    ${number}
    Select From List By Label    country_id   Lithuania
    Wait Until Element Is Visible   zone_id  20
    Wait Until Element Is Enabled  zone_id  10
    Select From List By Label    zone_id   Kaunas

Check Payment Method form
    Extra Click Element            ${continueButtonCheckout}
    Location Should Be             ${urlCheckoutPage}
    Page Should Contain Element    ${sectionPaymentMethod}
    Wait Until Page Contains       Warning: No Payment options are available. Please
    Page Should Contain Link      ${errorPaymentMethod3Link}
    Wait Until Page Contains       for assistance!

Check error message without check Terms & Conditions checkbox
    Extra Click Element            ${continueButtonCheckout}
    Location Should Be             ${urlCheckoutPage}
    Page Should Contain Element    ${sectionPaymentMethod}
    Wait Until Page Contains       Warning: You must agree to the Terms & Conditions!
    
Check error message after check Terms & Conditions checkbox
    Extra Click Element            ${termsConditionsButton}
    Location Should Be             ${urlCheckoutPage}
    Page Should Contain Element    ${sectionPaymentMethod}
    Wait Until Page Contains       Warning: Payment method required!
    
    
#Checkout page <--------------
#------------------------------------------------------------------------------------------------------------
# page -------------->





# page <--------------
#------------------------------------------------------------------------------------------------------------
