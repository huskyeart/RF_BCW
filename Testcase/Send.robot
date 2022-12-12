*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


Resource   ../Resources/CommonData/Common.robot
Resource   ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot

Test Setup  Common.Open Web
Test Teardown  Common.Close

*** Test Cases ***

ทดสอบการโอนส่งเหรียญด้วย Crypto Amount

    [Documentation]  ตรวจสอบการส่งโอนเหรียญ โดยการโอนไปให่้ผู้ใช้งานที่มีอยู่ในระบบ โดยใช้สกุลเงินคริปโต
    [Tags]  Fuctionvalid
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Keywords.คลิ๊กเข้ากระเป๋า    username1
    Wait Until Page Contains   Username success
    Keywords.InputAmountWis  5
    Wait Until Page Contains   Send Verify
    Wait Until Page Contains   Send Information
    Wait Until Page Contains   To Username
    Wait Until Page Contains   Please Verify Your Mobile To Send
    Wait Until Page Contains   Verify
    Keywords.VerifySendOtp  1
    Page Should Contain  Success
    Expect_results.สลิปการส่ง

ทดสอบการโอนส่งเหรียญด้วย Fiat Amount

    [Documentation]   ตรวจสอบการส่งโอนเหรียญ โดยการโอนไปให่้ผู้ใช้งานที่มีอยู่ในระบบ โดยใช้สกุลเงินบาท 
    [Tags]  Fuctionvalid
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Keywords.คลิ๊กเข้ากระเป๋า    username1
    Wait Until Page Contains   Username success
    Keywords.เลือกสกุลเงินไทยบาท
    Keywords.InputAmountFiat   179.20
    Wait Until Page Contains   Send Verify
    Wait Until Page Contains   Send Information
    Wait Until Page Contains   To Username
    Wait Until Page Contains   Please Verify Your Mobile To Send
    Wait Until Page Contains   Verify
    Keywords.VerifySendOtp  1
    Page Should Contain  Success
    Expect_results.สลิปการส่ง

ทดสอบการโอนส่งเหรียญใส่ชื่อผู้ส่ง ที่ไม่มีในระบบ

    [Documentation]  ตรวจสอบการส่งโอนเหรียญ โดยการโอนไปให่้ผู้ใช้งานที่ไม่มีอยู่ในระบบ
    [Tags]  Fuctioninvalid
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Keywords.คลิ๊กเข้ากระเป๋า    NotFound
    Expect_results.ไม่พบผู้ใช้งาน

    

    





    


    

    
    




