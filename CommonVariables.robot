*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Variables ***

#Home Page

${url}               https://www.demoshop24.com/
${browser}            Firefox
${titleTDS}           Your Store
#//*[@id="logo"]
${urlHomePage}      https://www.demoshop24.com/index.php?route=common/home
${myAccountMenu}    //*[@id="top-links"]/ul/li[2]/a
${loginOption}      //li[@class='dropdown open']/ul/li[2]/a
${registerOption}   //li[@class='dropdown open']/ul/li[1]/a
${continueButton}   //*[@id="content"]/form/div/div/input[2]
${titleRegAcc}      //*[@id="content"]/h1
${loginButton}      //*[@value='Login']
${urlRegPage}       https://www.demoshop24.com/index.php?route=account/register
${titleRegAcc}      //*[@id="content"]/h1
${logoutButton}      //*[@id="top-links"]/ul/li[2]/ul/li[5]/a


    #Header bar icons

${currencyIcon}        xpath://*[@id="form-currency"]
${currencyDropdown}    //*[@id="form-currency"]/div/button
${euro}                //*[@id="form-currency"]/div/ul/li[1]/button
${poundSterling}       //*[@id="form-currency"]/div/ul/li[2]/button
${usDollar}            //*[@id="form-currency"]/div/ul/li[3]/button
${phoneIcon}           //*[@id="top-links"]/ul/li[1]/span
#//*[@id="top-links"]/ul/li[1]/a/i
${wishListIcon}        //*[@id="wishlist-total"]/i
${shoppingCartIcon}    //*[@id="top-links"]/ul/li[4]/a/i
${checkoutIcon}        //*[@id="top-links"]/ul/li[5]/a/i


#Register account page

    #mandatory text fields
${firstName}                                   //*[@id="account"]/div[2]/label/text()
${lastName}                                    //*[@id="account"]/div[3]/label/text()
${email}                                       //*[@id="account"]/div[4]/label/text()
${telephone}                                   //*[@id="account"]/div[6]/label/text()
${password}                                    //*[@id="account"]/div[6]/label/text()
${passwordConfirm}                             //*[@id="account"]/div[7]/label/text()
    #input fields
${firstNameInput}                               //*[@id="input-firstname"]
${lastNameInput}                                //*[@id="input-lastname"]
${emailInput}                                   //*[@id="input-email"]
${telephoneInput}                               //*[@id="input-telephone"]
${passwordInput}                                //*[@id="input-password"]
${passwordConfirmInput}                         //*[@id="input-confirm"]


@{list of fields from Register Account page}    First Name  Last Name  E-Mail  Telephone  Password  Password Confirm
${inputFields}                                  //fieldset/div/div/input
${subscribe Yes/No}                             //fieldset/div/div/label
@{newsletter radio buttons}                     Yes  No
${privacyPolicy}                                //*[@id="content"]/form/div/div/input[1]
${placeholder}                                  placeholder
${success message}                             //*[@id="content"]/h1


${pageLogo}                        //*[@id="logo"]/h1/a
${success message}                 //*[@id="content"]/h1
${logout confirmation text}       //*[@id="content"]/h1
${continueButton after logout}    //*[@id="content"]/div/div/a
${alert existing account}         //*[@id="account-register"]/div[1]
# Warning: E-Mail Address is already registered!
${existingAccountMessage}        Warning: E-Mail Address is already registered!

${userName}                    Billy
${userSurname}                 Jean
${userPassword}                mypassword2024

${tooShortPasswordError}      Password must be between 4 and 20 characters!
${passwordsNotMatch}          Password confirmation does not match password!
${passwordErrorText}          //*[@id="content"]/form/fieldset[2]/div[1]/div/div
${confirmPasswordErrorText}  //*[@id="content"]/form/fieldset[2]/div[2]/div/div
${alert}                     //*[@id="account-register"]/div[1]
${privacyPolicyNotChecked}   Warning: You must agree to the Privacy Policy!
${continueButtonReg}         //*[@id="content"]/form/div/div/input[2]
${EMPTY}    # Leave this empty to simulate empty fields
${firstNameWarning}         First Name must be between 1 and 32 characters!
#//*[@id="account"]/div[2]/div/div
${lastNameWarning}        Last Name must be between 1 and 32 characters!
#//*[@id="account"]/div[3]/div/div
${emailWarning}           E-Mail Address does not appear to be valid!
#//*[@id="account"]/div[4]/div/div
${telephoneWarning}       Telephone must be between 3 and 32 characters!
#//*[@id="account"]/div[5]/div/div
${passwordWarning}         Password must be between 4 and 20 characters!
#//*[@id="content"]/form/fieldset[2]/div[1]/div/div

#Login - My Account page - Returning Customer Login Page

    #login form

${returningCustomerSection}       //*[@id="content"]/div/div[2]
${returningCustomerTitle}         //*[@id="content"]/div/div[2]/div/h2
${emailAddressLogin}              //*[@id="content"]/div/div[2]/div/form/div[1]/label
${emailAddressLoginInput}         //*[@id="input-email"]
${passwordLogin}                  //*[@id="content"]/div/div[2]/div/form/div[2]/label
${passwordLoginInput}             //*[@id="input-password"]
${loginButton}                    //*[@id="content"]/div/div[2]/div/form/input
${loginEmail}                     at@xmail.com
${loginPassword}                  auto12345
${textPageAfterLoginMyAccount}    //*[@id="content"]/h2[1]
${editInfoLink}                   //*[@id="content"]/ul[1]/li[1]/a
${urlMyAccountPage}               https://www.demoshop24.com/index.php?route=account/account
${titleMyAccount}                 //*[@id="content"]/h2[1]

${leftMenu}       //*[@id="content"]/ul/li/a
${rightMenu}      //*[@id="column-right"]/div/a
@{listLeftMenu}   Edit your account information  Change your password  Modify your address book entries  Modify your wish list  View your order history  Downloads  Your Reward Points  View your return requests  Your Transactions  Recurring payments  Register for an affiliate account  Subscribe / unsubscribe to newsletter
@{listRightMenu}  My Account  Edit Account  Password  Address Book  Wish List  Order History  Downloads  Recurring payments  Reward Points  Returns  Transactions  Newsletter  Logout

#${leftMenuTitles}  //*[@id="content"]/h2
#@{expectedLeftMenuTitles}  My Account  My Orders  My Affiliate Account  Newsletter

#Edit account page - My account information page

${editAccountLink}             //*[@id="column-right"]/div/a[2]
${urlEditAccount}              https://www.demoshop24.com/index.php?route=account/edit
${titleMyAccInformation}       //*[@id="content"]/h1
${titleYourPersonalDetails}    //*[@id="content"]/form/fieldset/legend
${editSuccessMessage}          //*[@id="account-account"]/div[1]
${updateSuccessMessage}        Success: Your account has been successfully updated.
${editFirstNameInput}          //*[@id="input-firstname"]
${editLastNameInput}           //*[@id="input-lastname"]
${editEmailInput}              //*[@id="input-email"]
${editTelephoneInput}          //*[@id="input-telephone"]
${editContinueButton}          //*[@id="content"]/form/div/div[2]/input
${editBackButton}              //*[@id="content"]/form/div/div[1]/a
@{listEditableInformation}     First Name  Last Name  E-Mail  Telephone
${inputElements}               //fieldset/div/div/input

#given data
${editGivenFirstName}          manual
${editGivenLastName}           testing
${editGivenEmail}              mt@xmail.com
${editGivenTelephone}          +371 22334455

${updatePass1}             ankgmailcom
${errorUpdatePass1}        Please include an '@' in the email address. 'ankgmailcom' is missing an '@'.
${updatePass2}             @ankgmailcom
${errorUpdatePass2}        Please enter a part followed by "@". '@ankgmailcom' is incomplete.
${updatePass3}             ank!@1acom

${successUpdatePass}           //*[@id="account-account"]/div[1]/text()

${emailValidationMessage}      //*[@id="content"]/form/fieldset/div[3]/div/div
${firstNameValidationMessage}  //*[@id="content"]/form/fieldset/div[1]/div/div
${lastNameValidationMessage}   //*[@id="content"]/form/fieldset/div[2]/div/div
${telephoneValidationMessage}  //*[@id="content"]/form/fieldset/div[4]/div/div

${invalidEmailMessage}      E-Mail Address does not appear to be valid!
${invalidFirstNameMessage}  First Name must be between 1 and 32 characters!
${invalidLastNameMessage}   Last Name must be between 1 and 32 characters!
${invalidTelephoneMessage}  Telephone must be between 3 and 32 characters!

#Change Password Page

${passwordChangeButton}          //*[@id="content"]/ul[1]/li[2]/a
${changePasswordInput}           //*[@id="input-password"]
${changeConfirmPasswordInput}    //*[@id="input-confirm"]
${changePasswordError}           //*[@id="content"]/form/fieldset/div[1]/div/div
${changeConfirmPasswordError}    //*[@id="content"]/form/fieldset/div[2]/div/div
${changePasswordContinueButton}  //*[@id="content"]/form/div/div[2]/input
${changePasswordBackButton}      //*[@id="content"]/form/div/div[1]/a

${titlePasswordPage}          Change Password
${subtitlePasswordPage}       Your Password
${titleMyAccountPage}         My Account
${urlChangePasswordPage}      https://www.demoshop24.com/index.php?route=account/password

${changePasswordBothLabels}  //*[@id="content"]/form/fieldset/div/label
${changePasswordBothFields}  //*[@id="content"]/form/fieldset/div/div/input

@{expectedBothFields}        Password  Password Confirm
@{expectedBothLabels}        Password  Password Confirm
${expectedContinueButton}    submit

${errorPasswordTooShort}     //*[@id="content"]/form/fieldset/div[1]/div/div
${errorPasswordDoNotMatch}   //*[@id="content"]/form/fieldset/div[2]/div/div
${successMessagePassword}    //*[@id="account-account"]/div[1]

#My Wish List Page

${urlWishListPage}          https://www.demoshop24.com/index.php?route=account/wishlist
${titleWishListPage}        My Wish List
${wishListButtonLink}       css: #wishlist-total
#//*[@id="top-links"]/ul/li[3]
${countWishListInitial}     //*[@id="wishlist-total"]/span
${countWishListExpected}    Wish List (0)
${countMacBookExpected}     Wish List (1)
${heartIconWishList}        //*[@id="wishlist-total"]/i
${continueButtonWishList}   //*[@id="content"]/div[2]/div/a
${AddToCartButton}          //*[@id="content"]/div[1]/table/tbody/tr/td[6]/button

${menuFieldsWishList}       //*[@id="content"]/div[1]/table/thead/tr/td
@{menuFieldsNameWishList}   Image  Product Name  Model  Stock  Unit Price  Action
${currency}                 //*[@id="form-currency"]/div/button/strong
${itemPrice}                //*[@id="content"]/div[1]/table/tbody/tr/td[5]/div
${titleFeaturedSection}     //*[@id="content"]/h3

${successAddWishList}       //*[@id="common-home"]/div[1]
${heartAddWishListButton}  //*[@id="content"]/div[2]/div[1]/div/div[3]/button[2]

${macBookItem}             //*[@id="content"]/form/div/table/tbody/tr/td[2]
#//*[@id="content"]/div[1]/table/tbody/tr/td[2]/a
${removeItemFromTable}     //*[@id="content"]/div[1]/table/tbody/tr/td[6]/a
${select another item add to the wish list button}  //*[@id="content"]/div[2]/div[3]/div/div[3]/button[2]

${myAccountRightMenu}          //*[@id="column-right"]/div/a[1]
${wishListRightMenu}           //*[@id="column-right"]/div/a[5]
${modifyWishListLeftMenu}      //*[@id="content"]/ul[1]/li[4]/a
${successMessageRemoveItem}    Success: You have modified your wish list!

#Shopping Cart Page

${urlShoppingCart}             https://www.demoshop24.com/index.php?route=checkout/cart
${titleShoppingCart}           Shopping Cart
${shoppingCartButtonLink}      //*[@id="top-links"]/ul/li[4]/a
${shoppingCartEmpty}           //*[@id="content"]/p
${successMessageMacBook}      Success: You have added MacBook to your shopping cart!
${newTitleShoppingCart}        Shopping Cart
${successMessageAddToCart}     //*[@id="account-wishlist"]/div[1]
${macBookAddToCart}            //*[@id="content"]/div[2]/div[1]/div/div[3]/button[1]
${iPhoneItem}                  //*[@id="content"]/div[2]/div[2]/div/div[1]/a
${iPhoneAddToCart}             //*[@id="button-cart"]
${successMessageIPhone}        Success: You have added iPhone to your shopping cart!
${removeButtonDropdown}        css: #cart > ul > li:nth-child(1) > table > tbody > tr > td:nth-child(5) > button
${shoppingCartBlackButton}     //*[@id="cart"]/button
${removeIPhone}                //*[@id="cart"]/ul/li[1]/table/tbody/tr[1]/td[5]/button
${twoItemsTotal}               2 item(s) - $725.20
${initialTotal}                //*[@id="cart-total"]/text()

${macBookDropdownFields}       //*[@id="cart"]/ul/li[1]/table/tbody/tr[2]/td
${iPhoneDropdownFields}        //*[@id="cart"]/ul/li[1]/table/tbody/tr[1]/td
${viewCartDropdownButton}      //*[@id="cart"]/ul/li[2]/div/p/a[1]/strong
${viewCartText}                View Cart
${checkoutDropdownButton}      //*[@id="cart"]/ul/li[2]/div/p/a[2]/strong
${checkoutText}                Checkout
${priceTableDropdown}          //*[@id="cart"]/ul/li[2]/div/table/tbody
${tableShoppingCart}           //*[@id="content"]/form/div/table

${tableFieldsShoppingCart}       //*[@id="content"]/form/div/table/thead/tr/td
@{tableFieldsTitleShoppingCart}  Image  Product Name    Model  Quantity  Unit Price  Total
${updateButtonShopCart}          //*[@id="content"]/form/div/table/tbody/tr/td[4]/div/span/button[1]
${removeButtonShopCart}          //*[@id="content"]/form/div/table/tbody/tr/td[4]/div/span/button[2]
${continueButtonShopCart}        //*[@id="content"]/div[3]/div[1]/a
${checkoutButtonShopCart}        //*[@id="content"]/div[3]/div[2]/a

${updateInputField}            //*[@id="content"]/form/div/table/tbody/tr/td[4]/div/input
${newQuantityValue}            2
${updateSuccessMessage}        Success: You have modified your shopping cart!
${initialQuantityValue}        1
${shopCartEmptyMessage}        Your shopping cart is empty!
${outOfStockMessage}           Products marked with *** are not available in the desired quantity or not in stock!
${outOfStockIphone}            iPhone ***
${iPhoneFieldTable}            //*[@id="content"]/form/div/table/tbody/tr/td[2]

#Checkout page

${urlCheckoutPage}            https://www.demoshop24.com/index.php?route=checkout/checkout
${titleCheckoutPage}          Checkout
${sectionCheckoutOptions}     //*[@id="accordion"]/div[1]/div[1]/h4
${sectionBillingDetails}      //*[@id="accordion"]/div[2]/div[1]/h4
${sectionPaymentMethod}       //*[@id="accordion"]/div[3]/div[1]/h4
${sectionConfirmOrder}        //*[@id="accordion"]/div[4]/div[1]/h4

${inputFieldsBillingDetails}    //form/div/div/div/input
${fieldsTitleBillingDetails}    First Name  Last Name  Company  Address 1  Address 2  City  Post Code
${countryMenuOptions}           //*[@id="input-payment-country"]
${countryPleaseSelect}          //*[@id="input-payment-country"]/option[1]
${regionMenuOptions}            //*[@id="input-payment-zone"]
${regionPleaseSelect}           //*[@id="input-payment-zone"]/option[1]

${newAddressBillingDetails}    //*[@id="collapse-payment-address"]/div/form/div[3]/label/input
${continueButtonCheckout}      //*[@id="button-payment-address"]
${errorMessagesLocator}        //*[@id="payment-new"]/div/div/div
${errorFirstNameBD}            First Name must be between 1 and 32 characters!
${errorLastNameBD}             Last Name must be between 1 and 32 characters!
${errorAddressBD}              Address 1 must be between 3 and 128 characters!
${errorCityBD}                 City must be between 2 and 128 characters!
${errorCountryBD}              Please select a country!
${errorRegionBD}               Please select a region / state!
${inputFieldsBD}               //*[@id="payment-new"]
${errorPaymentMethod}          //*[@id="collapse-payment-method"]/div/div[1]
${errorPaymentMethod1Text}     Warning: No Payment options are available. Please
${errorPaymentMethod2Text}     for assistance!
${errorPaymentMethod3Link}    //*[@id="collapse-payment-method"]/div/div[1]/a
${errorTermsConditions}        Warning: You must agree to the Terms & Conditions!
${errorPaymentMethodRequired}    Warning: Payment method required!
${termsConditionsButton}        //*[@id="collapse-payment-method"]/div/div[2]/div/input[1]
${sectionPayMethod}             //*[@id="collapse-payment-method"]