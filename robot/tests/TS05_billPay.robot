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
Resource         ../PO/BillPayPage.robot

*** Variables ***

*** Test Cases ***
TC01 Bill Pay to Account Number
	LandingPage.Fill The Login Form     ${username}         ${password}
	BillPayPage.Fill Bill Payment form and click Send Payment