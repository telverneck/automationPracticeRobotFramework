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
And I proceed to checkout    
    Wait Until Element Is Visible       ${cartModal}
    Click Element                       ${checkoutModalButton}

And I close the modal checkout 
    Wait Until Element Is Visible       ${cartModal}
    Click Element                       ${closeModalButton}
    Wait Until Element Is Not Visible   ${cartModal}

And I open the cart
    # Reload Page
    Wait Until Element Is Visible       ${shoppingCartButton}
    Mouse Over                          ${shoppingCartButton} 
    Click Element                       ${checkOutButton} 

And I check the item "${searchItem}" in the cart
    Then I must check this item "${searchItem}" in the cart

And I remove it
    Click Element                       ${deleteItemButton}

Then I must check this item "${searchItem}" in the cart
    Wait Until Element Is Visible       ${cartSummary}
    ${orderPageTitle}=                  Get Title
    Should Contain                      ${orderPageTitle}           Order
    Element Should Be Visible           ${cartSummary}
    Element Should Contain              ${productInCart}            ${searchItem}

Set state
    Select From List By Index       ${stateDropdown}        2
