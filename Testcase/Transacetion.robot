*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Documentation  BCWWEB

Resource   ../Resources/CommonData/Common.robot
Resource   ../Resources/Keywords/Keywords.resource
Resource   ../Resources/ExpectData/Expect_results.robot

Test Setup  Common.Open Web
Test Teardown  Common.Close

*** Test Cases ***

ประวัติธุรกรรม
    [Documentation]  VerifySend
    [Tags]  Fuctionvalid
    Keywords.ยอมรับคุ๊กกี๊
    Keywords.กรอกไอดี  ${ID}
    Keywords.กรอกรหัสผ่าน  ${Pass}
    Keywords.รหัสความปลอดภัย    1
    Keywords.คลิกล็อคอิน
    Keywords.เข้าดูประวัติธุรกรรม
    sleep  1s
    Page Should Contain Element    //span[@class="badge label-success"]