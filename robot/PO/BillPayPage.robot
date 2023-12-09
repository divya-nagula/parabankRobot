*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         ../PO/Generic.robot
Library          Collections
Library          Dialogs

*** Variables ***

*** Keywords ***
Fill Bill Payment form and click Send Payment
    Wait Until Element Is Visible    ${title}
    Click Element        xpath://div[@id='leftPanel']/ul/li/a[.='Bill Pay']
    Wait Until Element Is Visible    ${title}
    Element Text Should Be    ${title}        Bill Payment Service
    Input Text    xpath://input[@name='payee.name']    payeeName
    Input Text    xpath://input[@name='payee.address.street']      payeeAddress
    Input Text    xpath://input[@name='payee.address.city']        payeeCity
    Input Text    xpath://input[@name='payee.address.state']       payeeState
    Input Text    xpath://input[@name='payee.address.zipCode']     44115
    Input Text    xpath://input[@name='payee.phoneNumber']         8547596456
    Input Text    xpath://input[@name='payee.accountNumber']       52145
    Input Text    xpath://input[@name='verifyAccount']             52145
    Input Text    xpath://input[@name='amount']                    400
    Click Button    css:.button[value='Send Payment']
    Wait Until Page Contains    Bill Payment Complete
