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
${invalidEmailAlert}            css:.alert-danger
${emailLoginText}               id:email
${passwordLoginText}            id:passwd
${signInButton}                 id:SubmitLogin 
${signOutButton}                class:logout



***Keywords***
When I submit a valid random email
    ${email}=       Free Email  #random fake email
    Submit Email    ${email}

And I submit all personal information
    Fill All Mandatory Fields
    Click Element               ${registerButton}

When I submit a invalid email "${email}"
    Submit Email               ${email}

When I submit use "${login}" and password "${password}"
    Input Text                  ${emailLoginText}           ${login}
    Input Text                  ${passwordLoginText}        ${password}
    Click Element               ${signInButton}


Then I must see my account area
    Wait Until Element Is Visible   ${infoAccountLabel}
    Element Should Contain          ${infoAccountLabel}     Welcome to your account

And I logout
    Sign out 

When I access "${myAccountOption}" option from my account 
    Click Element               xpath://ul[@class='myaccount-link-list']//span[contains(text(), '${myAccountOption}')]





Then I must see error message "${message}"
    Wait Until Element Is Visible       ${invalidEmailAlert}
    Element Should Contain              ${invalidEmailAlert}     ${message}


Fill All Mandatory Fields
    Wait Until Element Is Visible           ${firstNameText} 
    And I have random data
    Input Text                  ${firstNameText}        ${FAKERDATA}[name]
    Input Text                  ${LastNameText}         ${FAKERDATA}[lastName]
    Input Text                  ${addressText}          ${FAKERDATA}[address]
    Input Text                  ${passwordText}         ${FAKERDATA}[password]
    Input Text                  ${mobilePhoneText}      ${FAKERDATA}[phone]
    Input Text                  ${portalCodeText}       ${FAKERDATA}[zipCode]
    Input Text                  ${cityText}             ${FAKERDATA}[city]
    Select From List By Value   ${stateDropdown}    ${FAKERDATA}[randomNumber]

Submit Email    
    [Arguments]     ${email}
    Input Text      ${emailText}        ${email}
    Click Button    ${createAccountButton}

Wrong User Creation 
    [Arguments]     ${wrongEmail}       ${message}
    Given that I access the "Sign in" and check the header "AUTHENTICATION"    
    When I submit a invalid email "${wrongEmail}"
    Then I must see error message "${message}"

Wrong login
    [Arguments]     ${wrongEmail}       ${wrongPassword}     ${message}
    Access login    ${wrongEmail}       ${wrongPassword}
    Then I must see error message "${message}"

login with 
    [Arguments]     ${USERLOGIN}        ${USERPASSWORD}
    Access login    ${USERLOGIN}        ${USERPASSWORD}
    Then I must see my account area

Access login
    [Arguments]     ${email}       ${passssword}
    Given that I access the "Sign in" and check the header "AUTHENTICATION"
    When I submit use "${email}" and password "${passssword}"

Sign out
    Given that I access the "Sign out" and check the header "AUTHENTICATION"

Go To Dashboard Option
    [Arguments]     ${option}       ${headerText}
    When I access "${option}" option from my account
    Then I must see the page with the header "${headerText}"