*** Settings ***
Documentation    To validate the signup form
Library          SeleniumLibrary
Library          Collections
Test Setup       open the browser with url
Suite Setup      Init
Test Teardown    Close Browser Session
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
Resource         ../PO/SignUpPage.robot
*** Variables ***


*** Test Cases ***
TC01 Validate Signup Process
	[Tags]          NEW_SIGNUP
	LandingPage.Click on Register Link
    SignUpPage.Fill the Signup form with valid data and click on Register       ${user_name}        ${password}
    SignUpPage.Verify the confirmation message and user is logged in

TC02 Verify Signup Process when username already exists
	LandingPage.Click on Register Link
    SignUpPage.Fill the Signup form with valid data and click on Register       ${user_name}        ${password}
    Generic.Wait Until element passed is located on Page
    SignUpPage.Verify error message when username already exists

TC03 Verify Signup Process when password and confirm password do not match
	LandingPage.Click on Register Link
	SignUpPage.Fill the signup form with non-matching passwords and click on Register       ${user_name}        ${password}
	SignUpPage.Verify Error Message when passwords don't match

TC04 Verify error messages when empty form is submitted
	LandingPage.Click on Register Link
    SignUpPage.Fill Signup form with empty values and click on Register
    SignUpPage.Verify Error Messages displayed when signup form is empty