***Keywords***

Start Session
    Open Browser                    ${BASE_URL}     ${BROWSER}
    Set Window Size                 ${WIDTH}        ${HEIGHT}
    Set Selenium Implicit Wait      ${TIMEOUT}
    Set Selenium Timeout            ${TIMEOUT}
    Title Should Be                 My Store

Finish Session
    Capture Page Screenshot
    Close Browser