***Settings***
Documentation           Test Home Screen

Resource                ../../Resources/base.robot

Test Setup              Start Session
Test Teardown           Finish Session

***Variables***
${searchText}            id:search_query_top 
${searchButton}          name:submit_search 
${searchResults}          css:.product-listing

***Test Cases***
Scenario1: Search valid content
    Given that I want to search for "Item 1"
    When I search for this
    Then I must see the results 


***Keywords***
Given that I want to search for "${item}"
    Set Test Variable   ${item}

When I search for this
    Input Text          ${searchText}   ${item}
    Click Button        ${searchButton}

Then I must see the results 
    Title Should Be                     Search - My Store 
    Wait Until Element Is Visible     ${searchResults} 
    Element Should Be Visible           ${searchResults}
    