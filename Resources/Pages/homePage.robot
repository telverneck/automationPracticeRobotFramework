***Variables***
${searchText}                       id:search_query_top  
${signInNavOption}                  css:nav div.header_user_info
${contactUsNavOption}               css:nav div#contact-link 
${phoneNavOption}                   css:nav span.shop-phone 
${navigationBar}                    css:#header .nav  
${pageHeader}                       xpath://h1[contains(@class,"page-subheading")] | //h1[contains(@class,"page-heading")]    
${popularTab}                       css:a.homefeatured    
${bestSellersTab}                   css:a.blockbestsellers 
${activePopularProductList}         css:.product_list.grid.row.homefeatured.tab-pane.active
${activeBestSallersProductList}     css:.product_list.grid.row.blockbestsellers.tab-pane.active
${homeSlider}                       id:homepage-slider 
${bannerOffers}                     id:htmlcontent_top 
${homeSliderNextButton}             css:.bx-next
${homeSliderPrevButton}             css:.bx-prev
${sponsorshipArea}                  css:#htmlcontent_home ul.htmlcontent-home.clearfix.row
${facebookArea}                     id:facebook_block
${aboutUsArea}                      id:cmsinfo_block
${facebookLink}                     css:#social_block li.facebook
${twitterLink}                      css:#social_block li.twitter
${youtubeLink}                      css:#social_block li.youtube
${googlePlusLink}                   css:#social_block li.google-plus
${successAlert}                     css:.alert-success
${errorAlert}                       css:.alert-danger
${newsletterText}                   id:newsletter-input  
${newsletterSubmitButton}           name:submitNewsletter 


***Keywords***
###################### GIVEN #######################
Given that I access the "${page}" and check the header "${header}"
    home navigation bar     ${page}     ${header}


###################### WHEN #######################
When I access the navigation bar link "${linkText}"
    Wait Until Element Is Visible   xpath://nav//*[contains(text(), "${linkText}")]
    Click Element                   xpath://nav//*[contains(text(), "${linkText}")] 

When I go to "${tabName}" tab
    Wait Until Element Is Visible   xpath://ul[@id='home-page-tabs']//a[contains(text(),'${tabName}')]
    Click Element                   xpath://ul[@id='home-page-tabs']//a[contains(text(),'${tabName}')] 
    Set Test Variable       ${tabName}

# Products menu
When I navigate in the product menu "${category}"
    Mouse Over          xpath://ul[contains(@class,'menu-content')]//a[contains(text(), '${category}')]

and I submit an option "${item}"
    Wait Until Element Is Visible   xpath://ul[contains(@class,'menu-content')]//ul//a[contains(@title, '${item}')]
    Wait Until Element Is Enabled   xpath://ul[contains(@class,'menu-content')]//ul//a[contains(@title, '${item}')]
    Click Element                   xpath://ul[contains(@class,'menu-content')]//ul//a[contains(@title, '${item}')]
    Set Test Variable       ${item}

When I scroll down until the Special category
    Execute Javascript      window.scrollTo(0,2000)

When I scroll down to the bottom
    Execute Javascript              window.scrollTo(0,document.body.scrollHeight)
    Wait Until Element Is Visible   ${newsletterSubmitButton}
    Element Should Be Visible       ${newsletterSubmitButton}

And I submit a valid newsletter email
    ${email}=       Free Email  #random fake email
    Input Email For Newsletter    ${email}  
    

And I submit a invalid newsletter email "${invalidEmail}"
    Input Email For Newsletter    ${invalidEmail}

###################### THEN #######################
And banner offers
    Element Should Be Visible       ${bannerOffers}

And I can navigate throught home slider images
    Click Element       ${homeSliderNextButton}
    Click Element       ${homeSliderPrevButton}

Then I must see the navigation bar with options "${optionText1}" and "${optionText2}"
    Element Should Be Visible       ${navigationBar}
    Element Should Be Visible       ${phoneNavOption}
    Element Text Should Be          ${contactUsNavOption}       ${optionText1}
    Element Text Should Be          ${signInNavOption}          ${optionText2}

Then I must see the page with the header "${text}"
    Element Should Contain          ${pageHeader}      ${text}


Then I must see the tabs "Popular" and "Best Sellers"
    Element Should Be Visible       ${popularTab}
    Element Should Be Visible       ${bestSellersTab}


Then I see the product list
    Run Keyword If               '${tabName}' == 'Popular'          Element Should Be Visible         ${activePopularProductList}
    ...     ELSE IF              '${tabName}' == 'Best Sellers'     Element Should Be Visible         ${activeBestSallersProductList}

Then I see the Home slider
    Element Should Be Visible       ${homeSlider} 


Then I must see all sponsorship area
    Element Should Be Visible       ${sponsorshipArea}    

Then I must see the Facebook area
    Element Should Be Visible       ${facebookArea}

Then I must see the About us information
    Element Should Be Visible         ${aboutUsArea}    
    
Then I must see all social media links
    Element Should Be Visible         ${facebookLink}    
    Element Should Be Visible         ${twitterLink}    
    Element Should Be Visible         ${youtubeLink}    
    Element Should Be Visible         ${googlePlusLink}  
    
Then I must see a success alert with text: "${message}"
    Wait Until Element Is Visible          ${successAlert}
    Element Should Contain                 ${successAlert}       ${message}

Then I must see an error alert with text: "${errorMessage}"
    Wait Until Element Is Visible          ${errorAlert}       ${LONG_TIMEOUT}
    Element Should Contain                 ${errorAlert}       ${errorMessage}


#KEYWORDS
home navigation bar 
    [Arguments]     ${link}     ${textHeader}
    When I access the navigation bar link "${link}"
    Then I must see the page with the header "${textHeader}"        


Best offers list 
    [Arguments]     ${tabName}
    When I go to "${tabName}" tab
    Then I see the product list

Product Menu Navigation
    [Arguments]     ${category}     ${subItem}
    When I navigate in the product menu "${category}"
    and I submit an option "${subItem}"
    Then I must see the results 

Input Email For Newsletter
    [Arguments]      ${email}
    Input Text       ${newsletterText}      ${email}
    Click Button     ${newsletterSubmitButton}

Wrong Newsletter
    [Arguments]     ${wrongEmail}   ${messageText}
    When I scroll down to the bottom
    And I submit a invalid newsletter email "${wrongEmail}"
    Then I must see an error alert with text: "${messageText}"