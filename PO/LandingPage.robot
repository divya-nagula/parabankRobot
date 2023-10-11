*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}      css:.error

*** Keywords ***
Fill the login form
	[Arguments]         ${username}         ${password}
	Input Text          css:.input[name='username']         ${username}
    Input Password      css:.input[name='password']         ${password}
    Click Button        css:.button[value='Log In']

wait until element is located on the page
    Generic.Wait Until element passed is located on Page   ${Error_Message_Login}

verify error message is correct for invalid login credentials
	${result}=  Get Text    ${Error_Message_Login}
	log     ${result}
    Should Be Equal As Strings    ${result}     An internal error has occurred and has been logged.

verify error message is correct for empty login credentials
	${result}=  Get Text    ${Error_Message_Login}
	log     ${result}
    Should Be Equal As Strings    ${result}     Please enter a username and password.

Fill the login form with empty values
    Click Button        css:.button[value='Log In']

Click on Register Link
	Click Element   xpath://*[@id='loginPanel']/p/a[.='Register']

