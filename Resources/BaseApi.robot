***Settings
Documentation       API doc: https://fakerestapi.azurewebsites.net/index.html
Library             RequestsLibrary
Library             Collections


***Variables

${BASE_API_URL}         https://fakerestapi.azurewebsites.net
${ALIAS}                fakeAPI 


***Keywords
API connection
    Create Session      ${ALIAS}       ${BASE_API_URL}

