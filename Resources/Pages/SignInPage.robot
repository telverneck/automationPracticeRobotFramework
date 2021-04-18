***Variables***
${emailText}                    id:email_create 
${createAccountButton}          id:SubmitCreate
${firstNameText}                id:customer_firstname
${LastNameText}                 id:customer_lastname
${passwordText}                 id:passwd
${addressText}                  id:address1
${cityText}                     id:city
${stateDropdown}                id:id_state
${countryDropdown}              id:id_country 
${mobilePhoneText}              id:phone_mobile 
${addressAliasText}             id:alias 
${registerButton}               id:submitAccount 
${portalCodeText}               id:postcode 
${infoAccountLabel}             class:info-account


***Keywords***
When I submit a valid random email
    ${email}=       Free Email  #random fake email
    Input Text      ${emailText}        ${email}
    Click Button    ${createAccountButton}

And I submit all personal information
    Wait Until Element Is Visible           ${firstNameText} 
    And I have random data
    Input Text      ${firstNameText}        ${FAKERDATA}[name]
    Input Text      ${LastNameText}         ${FAKERDATA}[lastName]
    Input Text      ${addressText}          ${FAKERDATA}[address]
    Input Text      ${passwordText}         ${FAKERDATA}[password]
    Input Text      ${mobilePhoneText}      ${FAKERDATA}[phone]
    Input Text      ${portalCodeText}       ${FAKERDATA}[zipCode]
    Input Text      ${cityText}             ${FAKERDATA}[city]
    Select From List By Value   ${stateDropdown}    ${FAKERDATA}[randomNumber]

    Click Element       ${registerButton}

Then I must see my account area
    Wait Until Element Is Visible   ${infoAccountLabel}
    Element Should Contain          ${infoAccountLabel}     Welcome to your account

And I have random data
    ${FAKERFIRSTNAME}=      First Name
    ${FAKERLASTNAME}=       Last Name
    ${FAKERADDRESS}=        Street Address
    ${FAKERPASSWORD}=       Password    length=10
    ${FAKERPHONE}=          Random Number   digits=9 
    ${FAKERZIPCODE}=        Postalcode
    ${FAKERCITY}=           City
    ${FAKERNUMBER}=         Randomize Nb Elements   le=2    min=1    max=50

    Set Test Variable   &{FAKERDATA}    name=${FAKERFIRSTNAME}  lastName=${FAKERLASTNAME}   address=${FAKERADDRESS} 
    ...     password=${FAKERPASSWORD}   phone=${FAKERPHONE}     zipCode=${FAKERZIPCODE}     city=${FAKERCITY}
    ...     randomNumber=${FAKERNUMBER}


