***Settings***
Documentation           Check Sign In functionality 

Resource                ../../Resources/Base.robot

Suite Setup              Start Session
Suite Teardown           Finish Session


***Test Cases***
Scenario1: Dashboard - Order history and details
    [Tags]                      smoke
    [Setup]                     Login With  ${USERLOGIN}     ${USERPASSWORD}
    [Teardown]                  Sign out
    [Template]                  Go To Dashboard Option
    Order history and details   ORDER HISTORY
    
Scenario2: Dashboard - My credit slips
    [Setup]                     Login With  ${USERLOGIN}     ${USERPASSWORD}
    [Teardown]                  Sign out
    [Template]                  Go To Dashboard Option
    My credit slips             CREDIT SLIPS

Scenario3: Dashboard - My address
    [Setup]                     Login With  ${USERLOGIN}     ${USERPASSWORD}
    [Teardown]                  Sign out
    [Template]                  Go To Dashboard Option
    My address                  MY ADDRESSES

Scenario4: Dashboard - My personal information
    [Setup]                     Login With  ${USERLOGIN}     ${USERPASSWORD}
    [Teardown]                  Sign out
    [Template]                  Go To Dashboard Option
    My personal information     YOUR PERSONAL INFORMATION

Scenario5: Dashboard - My wishlist
    [Setup]                     Login With  ${USERLOGIN}     ${USERPASSWORD}
    [Teardown]                  Sign out
    [Template]                  Go To Dashboard Option
    My wishlist                 MY WISHLIST
