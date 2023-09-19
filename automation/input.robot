*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
Google
    open my browser
    closing my browser
*** Keywords ***
open my browser
        Open Browser    https://www.google.com/     chrome
        Maximize Browser Window
closing my browser
        closing my browser

