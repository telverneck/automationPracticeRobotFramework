***Variables***
${searchText}               id:search_query_top 
${searchButton}             name:submit_search 
${searchResults}            css:.product-listing
${resultList}               css:.product_list.grid.row 
${alertMessage}             css:.alert-warning



***Keywords***
Given that I want to search for "${item}"
    Set Test Variable   ${item}

When I search for this
    Input Text          ${searchText}   ${item}
    Click Button        ${searchButton}

Then I must see the results 
    Title Should Be                     Search - My Store 
    Wait Until Element Is Visible       ${searchResults} 
    Element Should Be Visible           ${resultList} 
    Element Should Be Visible           xpath://span[contains(text(),"${item}")]

Then I must see the message "${message}"
    Title Should Be                     Search - My Store 
    Element Should Contain              ${alertMessage}     ${message}