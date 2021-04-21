***Variables***
${subjectHeadingDropdown}               id:id_contact 
${emailContactText}                     css:input#email
${orderReferenceText}                   id:id_order  
${messageTextArea}                      id:message  
${sendButton}                           id:submitMessage 
${fileUpload}                           id:fileUpload






***Keywords***
When I send a message
    Fill mandatory contact fields
    Send Message

When I try to send a message "${messageText}"
    Fill mandatory contact fields
    Clear Element Text                  ${messageTextArea}
    Send Message

When I try to send a message with email "${emailValue}" 
    Input Text                          ${emailContactText}             ${emailValue}
    Send Message

Send Message
    Click Button                        ${sendButton}

Fill mandatory contact fields
    And I have random data
    Wait Until Element Is Visible       ${sendButton}
    Select From List By Index           ${subjectHeadingDropdown}       ${FAKERDATA}[randomOption]
    Input Text                          ${emailContactText}             ${FAKERDATA}[email]
    Input Text                          ${orderReferenceText}           ${FAKERDATA}[randomNumber]
    Input Text                          ${messageTextArea}              ${FAKERDATA}[text]
    Choose File                         ${fileUpload}                   ${CURDIR}//test.txt

Wrong Email Message 
    [Arguments]     ${emailValue}       ${message}
    Given that I access the "Contact us" and check the header "CUSTOMER SERVICE - CONTACT US"
    When I try to send a message with email "${emailValue}"    
    Then I must see error message "${message}"