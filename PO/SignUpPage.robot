*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         ../PO/Generic.robot



*** Variables ***
${Error_Message_username}       customer.username.errors
${Error_Message_rpassword}      repeatedPassword.errors
${Error_Message_firstname}      customer.firstName.errors

*** Keywords ***
Fill the Signup form with valid data and click on Register
	[Arguments]         ${user_name}                ${password}
	Input Text          customer.firstName              firstName
	Input Text          customer.lastName               lastName
	Input Text          customer.address.street         street
	Input Text          customer.address.city           city
	Input Text          customer.address.state          state
	Input Text          customer.address.zipCode        12345
	Input Text          customer.phoneNumber            1234567890
	Input Text          customer.ssn                    9876543210
	Input Text          customer.username               ${user_name}
	Input Password      customer.password               ${password}
	Input Password      repeatedPassword                ${password}
	Click Button        css:.button[value='Register']

Verify the confirmation message and user is logged in
	Wait Until Element Is Visible       ${title}
	${welcomeNote}=                     Get Text           ${title}
	log     ${welcomeNote}
	Element Text Should Be              css:.title      Welcome ${user_name}
	${signupNote}=     Get Text        //*[@id='rightPanel']/p
	log                 ${signupNote}
	Element Should Be Visible    xpath://*[@id='leftPanel']/ul/li/a[.='Log Out']

Verify error message when username already exists
    Wait Until Element Is Visible    ${Error_Message_username}
    ${username_exist_message}=  Get Text     ${Error_Message_username}
    Log     ${username_exist_message}
    Element Text Should Be      customer.username.errors        This username already exists.

Fill the signup form with non-matching passwords and click on Register
		[Arguments]         ${user_name}                ${password}
	Input Text          customer.firstName              firstName
	Input Text          customer.lastName               lastName
	Input Text          customer.address.street         street
	Input Text          customer.address.city           city
	Input Text          customer.address.state          state
	Input Text          customer.address.zipCode        74857
	Input Text          customer.phoneNumber            8527419963
	Input Text          customer.ssn                    4567891255
	Input Text          customer.username               ${user_name}
	Input Password      customer.password               ${password}
	Input Password      repeatedPassword                xyz
	Click Button        css:.button[value='Register']

Verify Error Message when passwords don't match
    Wait Until Element Is Visible    ${Error_Message_rpassword}
    ${password_mismatch}=   Get Text    ${Error_Message_rpassword}
    Log    ${password_mismatch}
    Element Text Should Be    repeatedPassword.errors       Passwords did not match.

Fill Signup form with empty values and click on Register
	Click Button        css:.button[value='Register']

Verify Error Messages displayed when signup form is empty
	Wait Until Element Is Visible    ${Error_Message_firstname}
	@{field_names}=          Get Webelements    xpath://td/b
	FOR     ${field_name}   IN    @{field_names}
	    ${error_msg}=      Get Webelement    xpath://td/b[.='${field_name.text}']/parent::td//following-sibling::td[2]
    	IF          '${field_name.text}' != 'Phone #:'
  	        Element Should Contain          ${error_msg}        required

  	    ELSE IF     '${field_name.text}' == 'Phone #:'
            Element Should Not Contain      ${error_msg}      required
        END
        log     ${field_name.text}:${error_msg.text}
    END

wait until element is located on the page
    Generic.Wait Until element passed is located on Page   ${Error_Message_Login}