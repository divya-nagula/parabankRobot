*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         ../PO/Generic.robot

*** Variables ***
${Login_valid}          xpath://div/p[@class='smallText']

*** Keywords ***
wait until element is located on the page
    Generic.Wait Until element passed is located on Page   ${Login_valid}