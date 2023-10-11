*** Settings ***
Documentation    To validate the login form
Library          SeleniumLibrary
Library          Collections
Test Setup       open the browser with url
Suite Setup      Init
Test Teardown    Close Browser Session
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
Resource         ../PO/HomePage.robot
*** Variables ***
${no_user}      ${EMPTY}
${no_password}  ${EMPTY}

*** Test Cases ***
TC01 Verify login with valid credentials
	[Tags]          NEW_SIGNUP
	LandingPage.Fill the login form     ${username}         ${password}
    HomePage.wait until element is located on the page
    Log    Login Successful

TC02 Verify login with invalid credentials
	LandingPage.Fill the login form     username         password
	LandingPage.wait until element is located on the page
    LandingPage.verify error message is correct for invalid login credentials

TC03 Verify login with empty credentials
    LandingPage.Fill the login form with empty values
    LandingPage.wait until element is located on the page
    LandingPage.verify error message is correct for empty login credentials