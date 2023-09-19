*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
Google
    Open Browser    https://www.google.com/     chrome
    Maximize Browser Window
    Sleep   10
    Close Browser



*** Keywords ***



