***Variables***
${searchText}                       id:search_query_top  
${signInNavOption}                  css:nav div.header_user_info
${contactUsNavOption}               css:nav div#contact-link 
${phoneNavOption}                   css:nav span.shop-phone 
${navigationBar}                    css:#header .nav  
${pageHeader}                       xpath://h1[contains(@class,"page-heading")]    
${popularTab}                       css:a.homefeatured    
${bestSellersTab}                   css:a.blockbestsellers 
${activePopularProductList}         css:.product_list.grid.row.homefeatured.tab-pane.active
${activeBestSallersProductList}     css:.product_list.grid.row.blockbestsellers.tab-pane.active
${homeSlider}                       id:homepage-slider 
${bannerOffers}                     id:htmlcontent_top 
${homeSliderNextButton}             css:.bx-next
${homeSliderPrevButton}             css:.bx-prev




***Keywords***
Then I must see the navigation bar with options "${optionText1}" and "${optionText2}"
    Element Should Be Visible       ${navigationBar}
    Element Should Be Visible       ${phoneNavOption}
    Element Text Should Be          ${contactUsNavOption}       ${optionText1}
    Element Text Should Be          ${signInNavOption}          ${optionText2}

When I access the navigation bar link "${linkText}"
    Wait Until Element Is Visible   xpath://nav//*[contains(text(), "${linkText}")]
    Click Element                   xpath://nav//*[contains(text(), "${linkText}")] 

Then I must see the page with the header "${text}"
    Element Should Contain          ${pageHeader}      ${text}

home navigation bar 
    [Arguments]     ${link}     ${textHeader}
    When I access the navigation bar link "${link}"
    Then I must see the page with the header "${textHeader}"        

Then I must see the tabs "Popular" and "Best Sellers"
    Element Should Be Visible       ${popularTab}
    Element Should Be Visible       ${bestSellersTab}

When I go to "${tabName}" tab
    Wait Until Element Is Visible   xpath://ul[@id='home-page-tabs']//a[contains(text(),'${tabName}')]
    Click Element                   xpath://ul[@id='home-page-tabs']//a[contains(text(),'${tabName}')] 
    Set Test Variable       ${tabName}

Then I see the product list
    Run Keyword If               '${tabName}' == 'Popular'          Element Should Be Visible         ${activePopularProductList}
    ...     ELSE IF              '${tabName}' == 'Best Sellers'     Element Should Be Visible         ${activeBestSallersProductList}

Then I see the Home slider
    Element Should Be Visible       ${homeSlider} 

And banner offers
    Element Should Be Visible       ${bannerOffers}

And I can navigate throught home slider images
    Click Element       ${homeSliderNextButton}
    Click Element       ${homeSliderPrevButton}

# Products menu
When I navigate in the product menu "${category}"
    Mouse Over          xpath://ul[contains(@class,'menu-content')]//a[contains(text(), '${category}')]

and I submit an option "${item}"
    Wait Until Element Is Visible   xpath://ul[contains(@class,'menu-content')]//ul//a[contains(@title, '${item}')]
    Wait Until Element Is Enabled   xpath://ul[contains(@class,'menu-content')]//ul//a[contains(@title, '${item}')]
    Click Element                   xpath://ul[contains(@class,'menu-content')]//ul//a[contains(@title, '${item}')]
    Set Test Variable       ${item}

Product Menu Navigation
    [Arguments]     ${category}     ${subItem}
    When I navigate in the product menu "${category}"
    and I submit an option "${subItem}"
    Then I must see the results 