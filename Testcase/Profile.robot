*** Settings ***
Library  SeleniumLibrary
Documentation  BCWWEB

Resource   ../Resources/CommonData/Common.robot
Resource   ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot


Test Setup    Common.Open Web
Test Teardown  Common.Close


*** Test Cases ***

กรอกไอดีรหัสถูกต้อง
    [Documentation]  รหัสผ่านตรง
    [Tags]  Fuction
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Expect_results.ล๊อกอินเสร็จสิ้น

กรอกไอดีรหัสผ่านไม่ถูก
    [Documentation]  รหัสผ่านไม่ตรง
    [Tags]  FuctioninValid

    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน    ${pass2}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Expect_results.รหัสผ่านไม่ตรง

กรอกไอดีรหัสผ่านเว้นไว้
    [Documentation]  ไม่กรอกอะไรเลย
    [Tags]  FuctioninValid

    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${EMPTY}
    Keywords.กรอกรหัสผ่าน    ${EMPTY}
    Keywords.รหัสความปลอดภัย   ${EMPTY} 
    Keywords.คลิกล็อคอิน
    Expect_results.กรุณากรอก

