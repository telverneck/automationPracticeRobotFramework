***Variables***
${subjectHeadingDropdown}               id:id_contact 
${emailContactText}                     css:input#email
${orderReferenceText}                   id:id_order  
${messageTextArea}                      id:message  
${sendButton}                           id:submitMessage





***Keywords***
When I send a message
    And I have random data
    Wait Until Element Is Visible       ${sendButton}
    Select From List By Index           ${subjectHeadingDropdown}       ${FAKERDATA}[randomOption]
    Input Text                          ${emailContactText}             ${FAKERDATA}[email]
    Input Text                          ${orderReferenceText}           ${FAKERDATA}[randomNumber]
    Input Text                          ${messageTextArea}              ${FAKERDATA}[text]
    Click Button                        ${sendButton}

