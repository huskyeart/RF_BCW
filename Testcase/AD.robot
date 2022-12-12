*** Settings ***
Library  SeleniumLibrary


Resource   ../Resources/CommonData/Common.robot
Resource    ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot

#Suite Teardown  close all browsers

Test Setup  Common.Open Web
Test Teardown  Common.Close


*** Test Cases ***

ทดสอบการสร้างร้านซื้อ 
    [Documentation]    ทดสอบการสร้างร้านซื้อ เปิดร้านและปิดร้าน
    
    Set Selenium Speed    0.5s
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย  1
    Keywords.คลิกล็อคอิน  
    Keywords.เข้าการสร้างร้านค้า
    Keywords.สร้างร้านค้าซื้อ    1    100000000   สวัสดีครับ
    Expect_results.Active
    Keywords.ปิดร้านค้า
    Expect_results.DeActive

ทดสอบร้านขาย
    [Documentation]    ทดสอบการสร้างร้านขาย เปิดร้านและปิดร้าน

    Set Selenium Speed    0.5s
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย  1
    Keywords.คลิกล็อคอิน
    Keywords.เข้าการสร้างร้านค้า
    Keywords.สร้างร้านค้าขาย    1    100000000   สวัสดีครับ
    Expect_results.Active
    Keywords.ปิดร้านค้า
    Expect_results.DeActive

