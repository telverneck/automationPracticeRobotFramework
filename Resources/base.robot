***Settings
Library                 SeleniumLibrary
Library                 FakerLibrary

Resource                Hooks.robot
Resource                Pages/SearchPage.robot
Resource                Pages/HomePage.robot
Resource                Pages/CartPage.robot
Resource                Pages/SignInPage.robot
Resource                Pages/ContactUsPage.robot

***Variables
${BASE_URL}             http://automationpractice.com/index.php
${BROWSER}              chrome
${TIMEOUT}              20
${LONG_TIMEOUT}         30    
${WIDTH}                1400    
${HEIGHT}               900
${USERLOGIN}            telverneck@hotmail.com
${USERPASSWORD}         123456


***Keywords
And I have random data
    ${FAKERFIRSTNAME}=      First Name
    ${FAKERLASTNAME}=       Last Name
    ${FAKERADDRESS}=        Street Address
    ${FAKERPASSWORD}=       Password    length=10
    ${FAKERPHONE}=          Random Number   digits=9 
    ${FAKERZIPCODE}=        Postalcode
    ${FAKERCITY}=           City
    ${FAKERNUMBER}=         Randomize Nb Elements   le=2    min=1    max=50
    ${FAKEREMAIL}=          Free Email
    ${FAKEROPTION1OR2}=     Randomize Nb Elements   le=1    min=0    max=2
    ${FAKERTEXT}=           Text        max_nb_chars=200


    Set Global Variable   &{FAKERDATA}    name=${FAKERFIRSTNAME}  lastName=${FAKERLASTNAME}   address=${FAKERADDRESS} 
    ...     password=${FAKERPASSWORD}   phone=${FAKERPHONE}     zipCode=${FAKERZIPCODE}     city=${FAKERCITY}
    ...     randomNumber=${FAKERNUMBER}     email=${FAKEREMAIL}     randomOption=${FAKEROPTION1OR2}     text=${FAKERTEXT}
