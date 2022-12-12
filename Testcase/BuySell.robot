*** Settings ***
Library  SeleniumLibrary



Resource   ../Resources/CommonData/Common.robot
Resource   ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot

Test Setup  Common.Open Web
Test Teardown  Common.Close

*** Variables ***
${browser}  chrome 
${ADminid}  admin 
${AdminPass}  01e9#9nLX1qg 

*** Test Cases ***

ฝั่งซื้อ

    [Documentation]    ทดสอบการซื้อขาย ทดสอบช่องแชทซื้อขาย
    Set Selenium Speed    0.5s
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย  1
    Keywords.คลิกล็อคอิน
    Keywords.เลือกซื้อ
    Keywords.เลือกร้านที่จะซื้อ  Test Test
    Keywords.ตรวจสอบรายละเอียดการผู้ขาย  Test Test  Trade Limits : 100.00
    Keywords.กรอกจำนวณ
    Keywords.กดคำขอ
    execute javascript  window.scrollTo(0, 500)
    Wait Until Element Contains    //button[@class="cmn-btn bg--success w-100 user-action"]  Paid
    Click Element   //button[@class="cmn-btn bg--success w-100 user-action"]
    Wait Until Page Contains  Confirmation
    Click Element    //button[@id="yes-btn"]
    execute javascript  window.scrollTo(0, 200)
    Wait Until Element Contains     //span[@id="badge-paid"]    Paid
    Page Should Contain   paid

ขาขาย 

    [Documentation]    ทดสอบการซื้อขาย ทดสอบช่องแชทซื้อขาย
    Set Selenium Speed    0.5s
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี2  ${ID2}
    Keywords.กรอกรหัสผ่าน2    ${Pass2}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Keywords.หน้าออเดอร์
    execute javascript  window.scrollTo(0, 150)
    Keywords.จัดการออเดอร์
    Click Button    //button[@class="cmn-btn bg--success w-100 user-action"]
    Click Button    //button[@id="yes-btn"]
    execute javascript  window.scrollTo(0, 200)
    Click Element    //button[@id="release-btn"]
    sleep  5s
    Page Should Contain Element  //span[@id="badge-completed"]


ตรวจสอบการซื้อขายสำเร็จ

    [Documentation]    ทดสอบการซื้อขาย ทดสอบช่องแชทซื้อขาย
    Set Selenium Speed    0.5s
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย  1
    Keywords.คลิกล็อคอิน
    Keywords.หน้าเสร็จสิ้นออเดอร์
    Page Should Contain  admin222
    execute javascript   window.scrollTo(0, 200)
    Page Should Contain  พร้อม
    Page Should Contain Element  //span[@id="badge-completed"]