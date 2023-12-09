*** Settings ***
Documentation    A resource file with reusable keywords and variables
...
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported Selenium Library.
Library          SeleniumLibrary
Library          OperatingSystem
Library          DateTime

*** Variables ***
${user_name}            first1
${password}             password
${url}                  https://parabank.parasoft.com/parabank/index.htm
${browser_name}         Chrome
${file_name}            screenshots
${default_screenshot_path}      C:\Users\bittu.saishreyas\PycharmProjects\GitPush\parabankRobotProject\Screenshots
${title}                        css:.title
*** Keywords ***
Init
	Register Keyword To Run On Failure  Screenshots_Directory

open the browser with url
	Create Webdriver    ${browser_name}  resources/${browser_name}
	Delete All Cookies
	Go To    ${url}
	Maximize Browser Window

Wait Until element passed is located on Page
    [Arguments]         ${page_locator}
    Wait Until Element Is Visible   ${page_locator}

Screenshots_Directory
    Log    ${SUITE NAME}
    ${path}=    Join Path    ${default_screenshot_path}     ${SUITE NAME}
    Log    ${path}
	${screenshots}=     Create Directory    ${path}
	Log    ${screenshots}
    IF      '${screenshots}' != 'None'
        Set Screenshot Directory    ${screenshots}
    ELSE
        Set Screenshot Directory    ${path}
    END

    ${screenshot_index}=    Get Variable Value    ${screenshot_index}    ${0}
    Set Global Variable    ${screenshot_index}    ${screenshot_index.__add__(1)}
    ${date}=    Get Current Date    result_format=%d.%m.%Y@%H.%M
    Capture Page Screenshot    ${TEST NAME}-${date}-${screenshot_index}.png

Close Browser Session
	Close Browser

Delete cookies
	Delete All Cookies