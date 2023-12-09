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
#Resource         ../PO/AccountOverviewPage.robot
Resource         ../PO/TransferFundsPage.robot

*** Variables ***
${no_user}      ${EMPTY}
${no_password}  ${EMPTY}

*** Test Cases ***
TC01 Transfer Funds from one account to another
	LandingPage.Fill The Login Form     ${username}         ${password}
	TransferFundsPage.Transfer Funds

