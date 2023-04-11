*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***

*** Test Cases ***
ลองคลิก xpath
    คลิก xpath

*** Keywords ***
คลิก xpath
  Open Browser  https://www.google.com  browser=gc  options=add_experimental_option("detach", True)
  Maximize Browser Window
  input Text   name:q   robot framework
  Press Keys    name:q   RETURN
  Wait Until Element Is Enabled    id:result-stats
  ${TeText}=  Get Text  id:result-stats
  Log To Console    ${TeText}
  @{word}=  Split String  ${TeText}  ${SPACE}  4
  Log To Console   ${word[0]}  +  ${word[1]}
  Log To Console   ${word[1]}
  Log To Console   ${word[2]}
  Log To Console   ${word[3]}
  Log To Console   ${word[4]}
  Should Be Equal    ผลการค้นหาประมาณ   ${word[0]}
  