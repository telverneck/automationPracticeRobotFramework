***Settings***
Documentation           Check Search functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Search valid content
    [Tags]      smoke
    Given that I want to search for "t-shirt"
    When I search for this
    Then I must see the results 

Scenario2: No results search
    [Tags]      results
    [Template]  No result Search
    No results  No results were found for your search "No results"

Scenario3: No results search - special characters
    [Tags]      results
    [Template]  No result Search
    --------    No results were found for your search "--------"

Scenario4: No results search - numbers
    [Tags]      results
    [Template]  No result Search
    123456789   No results were found for your search "123456789"

Scenario5: No results search - underline
    [Tags]      results
    [Template]  No result Search
    "_____"     No results were found for your search ""_____""

Scenario6: No results search - pipe
    [Tags]      results
    [Template]  No result Search
    |||||     No results were found for your search "|||||"

Scenario7: No results search - slash
    [Tags]      results
    [Template]  No result Search
    //     No results were found for your search "//"

Scenario8: No results search - <%
    [Tags]      results
    [Template]  No result Search
    <%     No results were found for your search "<%"

Scenario9: No results search - #
    [Tags]      results
    [Template]  No result Search
    /#     No results were found for your search "/#"


Scenario10: No results search - empty
    [Tags]      results
    [Template]  No result Search
    ${EMPTY}    Please enter a search keyword
