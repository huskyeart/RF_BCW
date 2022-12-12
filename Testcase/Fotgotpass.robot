*** Settings ***
Library  SeleniumLibrary
Documentation  BCWWEB


Resource   ../Resources/CommonData/Common.robot
Resource   ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot


Test Setup  Common.Open Web
Test Teardown  Common.Close


*** Test Cases ***

กรอกไอดีรหัสถูกต้อง
    [Documentation]  ทกสอบการลืมรหัสผ่านและขอรหัสผ่านใหม่
    [Tags]  Fuction
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass3}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Keywords.ลืมรหัสผ่าน
    Expect_results.Verifycode 