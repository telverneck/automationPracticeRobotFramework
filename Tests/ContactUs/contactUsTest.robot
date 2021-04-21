***Settings***
Documentation           Check Contact Us functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Send a message
    [Tags]      smoke
    Given that I access the "Contact us" and check the header "CUSTOMER SERVICE - CONTACT US"
    When I send a message    
    Then I must see a success alert with text: "Your message has been successfully sent to our team."

Scenario2: Wrong message - empty email
    [Tags]      smoke   
    [Template]      Wrong Email Message
    ${EMPTY}        Invalid email address.

Scenario3: Wrong message - invalid email 1
    [Tags]      smoke   
    [Template]      Wrong Email Message
    test@           Invalid email address.

Scenario4: Wrong message - invalid email 2
    [Tags]      smoke   
    [Template]      Wrong Email Message
    test@ddd.       Invalid email address.

Scenario4: Wrong message - invalid email 3
    [Tags]      smoke   
    [Template]      Wrong Email Message
    123456789       Invalid email address.

Scenario6: Wrong message - empty message
    [Tags]      smoke
    Given that I access the "Contact us" and check the header "CUSTOMER SERVICE - CONTACT US"
    When I try to send a message "${EMPTY}"    
    Then I must see error message "The message cannot be blank."
    
