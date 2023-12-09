*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         ../PO/Generic.robot
Library          Collections
Library          Dialogs

*** Variables ***
${account_type}         CHECKING

*** Keywords ***
Transfer funds
    Wait Until Element Is Visible    ${title}
    Click Element        xpath://div[@id='leftPanel']/ul/li/a[.='Transfer Funds']
    Wait Until Element Is Visible    ${title}
    Element Text Should Be    ${title}        Transfer Funds
    ${amount_from_user}=    Get Value From User    Enter Amount
    Input Text    amount    ${amount_from_user}
    Click Button    css:.button[value='Transfer']
    Set Selenium Implicit Wait    10seconds
    Wait Until Page Contains    ${amount_from user}
    ${page_title}=    Get Text    xpath://h1
    Log    ${page_title}
    Element Should Contain        //div[@id='rightPanel']/div/div/p[1]    $${amount_from_user}.00 has been transferred