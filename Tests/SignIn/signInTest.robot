***Settings***
Documentation           Check Sign In functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Register a new user
    [Tags]      smoke
    Given that I access the "Sign in" and check the header "AUTHENTICATION"
    When I submit a valid random email
    And I submit all personal information
    Then I must see my account area
    And I logout

Scenario2: Success Login
    [Tags]      smoke       login
    Given that I access the "Sign in" and check the header "AUTHENTICATION"
    When I submit use "${USERLOGIN}" and password "${USERPASSWORD}"
    Then I must see my account area
    And I logout

Scenario3: Create user - Invalid email
    [Template]  Wrong User Creation
    test@hot.   Invalid email address.

Scenario4: Create user - Invalid user - Empty
    [Template]  Wrong User Creation
    ${EMPTY}    Invalid email address.

Scenario5: Invalid Login - wrong User
    [Template]      Wrong login
    nouser@test.com     126456      Authentication failed.

Scenario6: Invalid Login - invalid email format
    [Template]      Wrong login
    nouser      126456      Invalid email address.

Scenario7: Invalid Login - empty email
    [Template]      Wrong login
    ${EMPTY}        126456      An email address required.

Scenario8: Invalid Login - empty password
    [Template]      Wrong login
    nouser@test.com     ${EMPTY}        Password is required.