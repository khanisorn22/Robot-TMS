*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ชื่อซ้ำ}=  ข้อมูลชื่อซ้ำRobot


*** Test Cases ***
เปิด Browser เพื่อใช้งาน TMS Web
   เปิด Browser เพื่อใช้งาน TMS Web
ตรวจสอบการเพิ่มข้อมูลโครงการรถสำเร็จ
   คลิกเข้าเมณู "โครงการรถ"
   คลิกปุ่ม "เพิ่ม"
   กรอกข้อมูล
   คลิกปุ่ม "บันทึก"
   ยืนยันบันทึกข้อมูล
   ตรวจสอบข้อมูลบันทึกสำเร็จ
   คลิกปุ่ม "ตกลง"
ตรวจสอบการเพิ่มข้อมูล โครงการรถไม่สำเร็จกรณี กรอกข้อมูลไม่ครบถ้วน
   คลิกปุ่ม "เพิ่ม"
   คลิกปุ่ม "บันทึก"
   ตรวจสอบข้อมูลแสดงผลไม่ครบถ้วน
   คลิกปุ่มกลับ
ตรวจสอบการเพิ่มข้อมูลโครงการรถไม่สำเร็จกรณี ชื่อโครงการรถมีอยู่ในระบบแล้ว
   คลิกเข้าเมณู "โครงการรถ"
   คลิกปุ่ม "เพิ่ม"
   กรอกข้อมูล ชื่อโครงการรถซ้ำ
   คลิกปุ่ม "บันทึก"
   ยืนยันบันทึกข้อมูล
   ตรวจสอบข้อมูลแสดงผลชื่อซ้ำ
   คลิกปุ่มกลับ
ตรวจสอบการทำงานปุ่ม กลับ กรณี 'โครงการรถ>เพิ่ม'
   คลิกปุ่ม "เพิ่ม"
   คลิกปุ่มกลับ

ตรวจสอบการเปลี่ยนแปลง Status กรณี Active > Inactive
    กรอกข้อมูลค้นหาข้อมูล เปลี่ยนสถานะ
    คลิกปุ่มสถานะ เปิดใช้งาน>ปิดใช้งาน
    ตรวจสอบข้อมูลแสดงผลสถานะปิดใช้งาน
    คลิกปุ่มสถานะ ปิดใช้งาน>เปิดใช้งาน
    ตรวจสอบข้อมูลแสดงผลสถานะเปิดใช้งาน
    

*** Keywords ***
เปิด Browser เพื่อใช้งาน TMS Web
     Open Browser   https://tms-dev-web.logisboysolutions.com/  browser=gc
     ...  options=add_experimental_option("detach", True)
     Maximize Browser Window
คลิกเข้าเมณู "โครงการรถ"
     Wait Until Page Contains    โครงการรถ
     Click Element    xpath=//*[@id="app"]/div/div/div/nav/div/div/ul/li[1]/a
คลิกปุ่ม "เพิ่ม" 
     Wait Until Page Contains   ชื่อโครงการรถ
     Wait Until Element Is Enabled  xpath=//*[@id="app"]/div/div/div/main/div/div/div[2]/div[2]/div[1]/button
     Click Element    xpath=//*[@id="app"]/div/div/div/main/div/div/div[2]/div[2]/div[1]/button
กรอกข้อมูล
     Wait Until Page Contains    ชื่อโครงการรถ > เพิ่ม
     Page Should Contain Textfield     class=v-field__input
     Input Text     class=v-field__input    โครงการRobot123
คลิกปุ่ม "บันทึก"
     Click Element    xpath=//*[@id="app"]/div/div/div/main/div/div/div[2]/form/div[1]/div/span[2]/button/span[3]
ยืนยันบันทึกข้อมูล
     Wait Until Page Contains    คุณต้องการบันทึกข้อมูลใช่หรือไม่ ?
     Click Element     xpath=/html/body/div[3]/div/div[6]/button[1]
ตรวจสอบข้อมูลบันทึกสำเร็จ
    Wait Until Page Contains  บันทึกข้อมูลสำเร็จ
คลิกปุ่ม "ตกลง"
    Click Element     xpath=/html/body/div[3]/div/div[6]/button[1]
    
ตรวจสอบข้อมูลแสดงผลไม่ครบถ้วน
    Wait Until Element Is Enabled    id=swal2-title
    Wait Until Page Contains    กรุณากรอกข้อมูลให้ครบถ้วน
    Click Element    class=swal2-confirm
คลิกปุ่มกลับ
    Wait Until Element Is Not Visible    id=swal2-title
    Click Element    Class=v-btn__content
กรอกข้อมูล ชื่อโครงการรถซ้ำ
     Wait Until Page Contains    ชื่อโครงการรถ > เพิ่ม
     Page Should Contain Textfield     class=v-field__input
     Input Text     class=v-field__input    ${ชื่อซ้ำ}

ตรวจสอบข้อมูลแสดงผลชื่อซ้ำ
    Wait Until Element Is Enabled    id=swal2-title
    Wait Until Page Contains    "${ชื่อซ้ำ}"มีข้อมูลอยู่แล้วในระบบกรุณาตรวจสอบใหม่อีกครั้ง
    Wait Until Element Is Enabled  class=swal2-confirm
    Click Element    class=swal2-confirm--