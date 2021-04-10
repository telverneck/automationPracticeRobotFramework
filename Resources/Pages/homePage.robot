***Variables***
${searchText}               id:search_query_top  
${signInNavOption}          css:nav div.header_user_info
${contactUsNavOption}       css:nav div#contact-link 
${phoneNavOption}           css:nav span.shop-phone 
${navigationBar}            css:#header .nav  
${pageHeader}               xpath://h1[contains(@class,"page-heading")]       





***Keywords***
Then I must see the navigation bar with options "${optionText1}", "${optionText2}"
    Element Should Be Visible       ${navigationBar}
    Element Should Be Visible       ${phoneNavOption}
    Element Text Should Be          ${contactUsNavOption}       ${optionText1}
    Element Text Should Be          ${signInNavOption}          ${optionText2}

When I access the navigation bar link "${linkText}"
    Wait Until Element Is Visible   xpath://nav//*[contains(text(), "${linkText}")]
    Click Element                   xpath://nav//*[contains(text(), "${linkText}")] 

Then I must see the page with the header "${text}"
    Element Should Contain          ${pageHeader}      ${text}

        