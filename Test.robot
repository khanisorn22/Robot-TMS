*** Settings ***
Library  SeleniumLibrary


*** Variables *** 
${url1}  https://swine-health-web-dev.logisboysolutions.com/master/organ/form/45

*** Test Cases ***
Check
    1. เปิด Browser swinehealth
    2. login
    3. เข้า menu organ 
    4. เลือกรายการ
    5. กรอกข้อมูลไม้ได้



*** Keywords ***
1. เปิด Browser swinehealth
     Open Browser  ${url1} 
     ...    browser=gc  options=add_experimental_option("detach", True)
     Maximize Browser Window
2. login
    Input Text    id:__BVID__35    doctor
    Input Text    id:__BVID__36    123
    Click Element    xpath://*[@id="__layout"]/div/div/div[4]/div[3]/button
3. เข้า menu organ
    Wait Until Page Contains    Master
    Click Element    xpath://*[@id="collapse4"]
    Wait Until Element Is Enabled    xpath://*[@id="__layout"]/div/div[2]/div/div[6]/div/ul[10]/li/span[2]
    Click Element    xpath://*[@id="__layout"]/div/div[2]/div/div[6]/div/ul[10]/li/span[2]
4. เลือกรายการ
    Wait Until Page Contains    Master > Organ system
    Go To    https://swine-health-web-dev.logisboysolutions.com/master/organ/form/45
5. กรอกข้อมูลไม้ได้
    Element Should Be Disabled  xpath://*[@id="__layout"]/div/div[4]/div/div/div/div[1]/div/div/div[2]/div/form/div/div/div/input
