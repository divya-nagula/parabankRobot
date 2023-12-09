*** Settings ***
Documentation    To validate the Account Overview page
Library          SeleniumLibrary
Library          Collections
Test Setup       open the browser with url
Suite Setup      Init
Test Teardown    Close Browser Session
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
# Resource         ../PO/HomePage.robot
Resource         ../PO/AccountOverviewPage.robot
*** Variables ***
${no_user}      ${EMPTY}
${no_password}  ${EMPTY}

*** Test Cases ***
TC01 Verify User's Account details
	LandingPage.Fill The Login Form     ${username}         ${password}
	AccountOverviewPage.Get all Account Details

TC02 Create New Account
    LandingPage.Fill The Login Form     ${username}         ${password}
    AccountOverviewPage.Open New Account
    AccountOverviewPage.Verify Account Details
    AccountOverviewPage.Get all Account Details