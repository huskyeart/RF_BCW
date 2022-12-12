*** Settings ***
Library  SeleniumLibrary
Documentation  BCWWEB
Resource   ../Resources/CommonData/Common.robot
Resource   ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot

Test Setup  Common.Open Web
Test Teardown  Common.Close




*** Test Cases ***
HomePage_NoLogin
    [Documentation]    ตรวจสอบหน้าแรก แบบยังไม่ได้เข้าสู่ระบบจะต้องเห็นปุ่มเข้าสู่ระบบ
    [Tags]   Homepage
    Set Selenium Speed  0.75s
    Keywords.ยอมรับคุ๊กกี๊
    sleep  2s
    Expect_results.หน้าหลักเมื่อไม่ได้เข้าสู่ระบบ

HomePageLogin
  [Documentation]   ตรวจสอบหน้าแรก แบบเข้าสู่ระบบจะต้องไม่เห็นปุ่มเข้าสู่ระบบ
  [Tags]  Homepage
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}  
    Keywords.กรอกรหัสผ่าน  ${Pass}  
    Keywords.รหัสความปลอดภัย  1
    Keywords.คลิกล็อคอิน
    Keywords.คลิกไปหน้าแรก
    Expect_results.หน้าหลักเมื่อเข้าสู่ระบบ