***Variables***
${searchText}               id:search_query_top 
${searchButton}             name:submit_search 
${searchResults}            css:.product-listing
${resultList}               css:.product_list.grid.row 
${alertMessage}             css:.alert-warning
${addToCartButton}          css:a[class*=add_to_cart]
${cartModal}                id:layer_cart
${checkoutModalButton}      css:a[title*=checkout]
${cartSummary}              id:cart_summary
${productFoundCountainer}   css:div.product-container
${itemHovered}              css:ul[class*=product_list] li[class*=hovered]
${productInCart}            css:#order-detail-content p.product-name
${closeModalButton}         class:cross 
${shoppingCartButton}       css:.shopping_cart a
${deleteItemButton}         class:icon-trash 
${alertWarning}             css:.alert-warning
${checkOutButton}           id:button_order_cart



***Keywords***
Given that I want to search for "${item}"
    Set Test Variable   ${item}

When I search for this
    Input Text          ${searchText}   ${item}
    Click Button        ${searchButton}

When I add this item to the cart
    Wait Until Element Is Visible       ${productFoundCountainer}
    When I scroll down to the bottom
    Wait Until Element Is Visible       ${productFoundCountainer}
    Mouse Over                          ${productFoundCountainer}
    Wait Until Element Is Visible       ${itemHovered}
    Wait Until Element Is Visible       ${addToCartButton}
    Click Element                       ${addToCartButton}
    

And I proceed to checkout    
    Wait Until Element Is Visible       ${cartModal}
    Click Element                       ${checkoutModalButton}



Then I must see the results 
    # Title Should Be                     Search - My Store 
    Wait Until Element Is Visible       ${searchResults} 
    Element Should Be Visible           ${resultList} 
    Element Should Be Visible           xpath://span[contains(text(),"${item}")]

Then I must see the message "${message}"
    # Title Should Be                     Search - My Store 
    Wait Until Element Is Visible       ${alertMessage}
    Element Should Contain              ${alertMessage}     ${message}

No result Search
    [Arguments]     ${text}     ${message}
    Given that I want to search for "${text}"
    When I search for this
    Then I must see the message "${message}" 

Search Item
    [Arguments]     ${item}
    Given that I want to search for "${item}"   
    When I search for this
    Then I must see the results 