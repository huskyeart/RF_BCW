*** Settings ***
Library  SeleniumLibrary

Resource   ../Keywords/Keywords.resource

*** Variables ***



*** Keywords ***

ผลลัพธ์คุกกี๊
    Sleep  3s
    Page Should Contain  ยอมรับคุกกี้เรียบร้อยแล้ว

หน้าหลักเมื่อไม่ได้เข้าสู่ระบบ
    Sleep  3s
    Page Should Contain  Register
    Page Should Contain  Login

หน้าหลักเมื่อเข้าสู่ระบบ
    Sleep  3s
    Page Should Not Contain  สมัครสมาชิก
    Page Should Not Contain  เข้าสู่ระบบ

Register

    Sleep  3s
    Page Should Contain  //img[@src="https://stg.bitcoinworld.exchange/assets/images/default.png"]

RegisterInvalid

     Sleep  3s
     Page Should Contain  เบอร์ถูกนำไปใช้แล้ว

ล๊อกอินเสร็จสิ้น

    sleep  3s
    Page Should Contain  Profile Setting

รหัสผ่านไม่ตรง
    Log to Console  These credentials do not match our records.

SendUsernameValid
    Page Should Contain   username success

กรุณากรอก
    Log to Console  กรุณากรอก
    Page Should Contain  Please enter

สลิปการส่ง
    Execute Javascript  window.scrollTo(0, 300)
    
    Page Should Contain Element    //div[@class="col-md-12"]
    Page Should Contain Element   //a[@class="cmn-btn d-block text-center btn-md mt-4"]

ไม่พบผู้ใช้งาน
    Execute Javascript  window.scrollTo(0, 200)
    sleep  1s
    Page Should Contain Element   //*[@id="notFound"]/small 

Active
    
    Go To    http://localhost:7600/user/advertisements
    Page Should Contain     active

DeActive

    Go To    http://localhost:7600/user/advertisements
    Page Should Contain Element     //table/tbody/tr[1]/td[7]/span

Verifycode

    Page Should Contain    Verification Process
    

# ประวัติการส่ง

#     Click Element  //a[@href="http://localhost:7600/user/send/history"]
#     Page Should Contain  



