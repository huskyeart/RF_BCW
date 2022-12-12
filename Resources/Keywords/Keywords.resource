*** Settings ***

Library  SeleniumLibrary



*** Variables ***
${ID}  0623145557
${ID2}  841558728
${Pass}  @Aa555666
${Pass2}    @Aa555666
${Pass3}  !Aa555666
${lastname}  Spiderman
${firstname}  Parker
${username}  0623145557
${mobile}  0623145557
${confirm}  @Aa555666
${Captcha}  1
${usernameforsend}  username1
${Page buy}    //h3[@class="page-title"]
${ใส่ราคา}  100
${Accept Cookie}    //button[@class="cmn-btn policy cookie"]

*** Keywords ***

ยอมรับคุ๊กกี๊
    # Maximize Browser Window
    Set Selenium Speed    2s
    Wait Until Element Is Visible  //button[@class="cmn-btn policy cookie"]  5s
    Click Element  //button[@class="cmn-btn policy cookie"]
    sleep  2s


# Accept Cookies
#      Wait Until Page Contains Element   ${Accept Cookie}
#      Click Element   ${Accept Cookie}
#      ${cookie_banner_closed}   Run Keyword And Return Status
#      Wait Until Page Contains  /*continued*/
#      Wait Until Page Does Not Contain   ${Accept Cookie}     2s
#      Run Keyword If   ${cookie_banner_closed}== Fauls 
#      Click Element   ${Accept Cookie}

#ทดสอบเคสล๊อคอิน
กรอกไอดี
    [Arguments]  ${id}   
    Set Selenium Speed    0.5s
    Wait Until Element Is Visible  //a[@class="cmn-btn" and @href="login"]
    Click Element   //a[@class="cmn-btn" and @href="login"]
    Input text  //input[@id="mobile_number"]  ${id}

กรอกไอดี2
    [Arguments]  ${id2}
    sleep  2s   
    
    Set Selenium Speed    0.5s
    # Mouse Over   //*[@id="navbarSupportedContent"]/div/ul
    Click element  //a[@class="cmn-btn" and @href="login"]
    Input text  //input[@id="mobile_number"]  ${id2}

กรอกรหัสผ่าน
    [Arguments]  ${pass}
    
    Input text  //input[@id="password"]  ${Pass}

กรอกรหัสผ่าน2
    [Arguments]  ${pass2}
    
    Input text  //input[@id="password"]  ${Pass2}

รหัสความปลอดภัย
    [Arguments]  ${captcha}
    Input text  //input[@id="captcha"]  ${captcha}

คลิกล็อคอิน
    Click Element  //button[@id="login-btn"]

คลิกไปหน้าแรก
    Go To  http://localhost:7600/

# Verify Register

#    Set Selenium Speed  1 seconds
#     Wait Until Element Is Visible  //a[@href="register"]
#     Click Element  //a[@href="register"]
#     Wait Until Element Is Visible   //h2[@class="text-white mb-4"]
#     Input text    //input[@id="firstname"]  ${firstname}
#     Input text    //input[@id="lastname"]  ${lastname}
#     Input text    //input[@id="username"]  ${id}
#     Input text    //input[@id="mobile"]    ${mobile}
#     Input text    //input[@id="password"]  ${pass}
#     Input text    //input[@id="password-confirm"]  ${confirm}
#     Click Element   //label[@for="agree"]
#     Sleep  6s
#     Wait Until Element Is Visible   //h4[@class="mb-4 text-center"]
#     Sleep  6s
#     Wait Until Location Is     https://stg.bitcoinworld.exchange/user/dashboard


# Verify Register invalid

#     Set Selenium Speed  1 seconds
#     Wait Until Element Is Visible  //a[@href="register"]
#     Click Element  //a[@href="register"]
#     Wait Until Element Is Visible   //h2[@class="text-white mb-4"]
#     Input text    //input[@id="firstname"]  ${firstname}
#     Input text    //input[@id="lastname"]  ${lastname}
#     Input text    //input[@id="username"]  ${id}
#     Input text    //input[@id="mobile"]    ${mobile}
#     Input text    //input[@id="password"]  ${pass}
#     Input text    //input[@id="password-confirm"]  ${confirm}
#     Click Element   //label[@for="agree"]
#     sleep  3s

# Keywords ใช้สำหรับทดสอบการ ส่งเหรียญ 
คลิ๊กเข้ากระเป๋า 
    [Arguments]  ${usernamesend}
    Set Selenium Speed  0.25s
    Click Element  //a[@href="http://localhost:7600/user/wallets"]
    Click Element  //i[@class="las la-credit-card"]  #sendwis
    input text  //input[@id="searchUsername"]    ${usernamesend}
    Select From List By Label   //select[@id="type"]   Fiat Amount
    Select From List By Index  //select[@id="type"]  0

เลือกสกุลเงินไทยบาท

    Select From List By Label   //select[@id="type"]   Fiat Amount


InputAmountWis
    [Arguments]  ${Amount}

    input text  //input[@id="amount" and @name="amount"]  ${Amount}
    ${calculatedTotalPrice} =    set variable    ${Amount}
    ${WisPrice} =    set variable    ${35.84}
    ${TotalPrice} =  Evaluate  ${calculatedTotalPrice}*${WisPrice}
    ${Resultss} =  Convert To Number  ${TotalPrice}  2
    #log to console  ${calculatedTotalPrice}
    Page Should Contain  ${Resultss}
    SeleniumLibrary.execute javascript  window.scrollTo(0, 300)
    sleep  1s
    Click Element   //button[@id="send-btn" and @class="cmn-btn w-100"]

InputAmountFiat
    [Arguments]  ${Amount}

    input text  //input[@id="amount" and @name="amount"]  ${Amount}
    ${calculatedTotalPrice} =    set variable    ${Amount}
    ${FiatPrice} =    set variable    ${0.02790179}
    ${TotalPrice} =  Evaluate  ${calculatedTotalPrice}*${FiatPrice}
    ${Resultss} =  Convert To Number  ${TotalPrice}  2
    #log to console  ${calculatedTotalPrice}
    Page Should Contain  ${Resultss}
    SeleniumLibrary.execute javascript  window.scrollTo(0, 300)
    sleep  1s
    Click Element   //button[@id="send-btn" and @class="cmn-btn w-100"]

VerifySendOtp
    [Arguments]  ${OTPCode}
    
    Input Text  //input[@id="code"]  ${OTPCode}
    SeleniumLibrary.execute javascript  window.scrollTo(0, 400)
    Click Element  //button[@id="verify-btn"]

SlipCheck
    
    Page Should Contain  {$Resultss}

เข้าดูประวัติธุรกรรม

    Mouse Over   //*[@id="navbarSupportedContent"]/div/ul/li
    Click Element    //a[@href="http://localhost:7600/user/transactions"]
    Page Should Contain  Send
    Page Should Contain  Success


เลือกซื้อ
   
   Click Element  //a[@href="http://localhost:7600/buy/WIS"]
  
    
เลือกร้านที่จะซื้อ
   [Arguments]  ${เลือกร้าน}
   
   execute javascript  window.scrollTo(0, 500)
   Page Should Contain  ${เลือกร้าน}
   Click Link   //a[@href="http://localhost:7600/user/trade-request/new/12" and @class="cmn-btn btn-sm"]

ตรวจสอบรายละเอียดการผู้ขาย
    [Arguments]  ${เลือกร้าน}  ${ขั้นต่ำ}
    Page Should Contain  ${เลือกร้าน}
    Page Should Contain  ${ขั้นต่ำ}

กรอกจำนวณ
  # [Arguments]  ${THB}  
   Input Text   //input[@id="amount"]    ${ใส่ราคา}
   #${WIS PRICE} =  Set Variable   ${0.02790179}
   #${TotalPrice} =  Evaluate  ${WIS PRICE}*${THB}
  # ${Resultss2} =  Convert To Number  ${TotalPrice}  8
   Input Text  //textarea[@id="msg-box"]  สวัสดีครับ 

กดคำขอ
    execute javascript      window.scrollTo(0, 500)
    Click Element  //button[@id="send-btn"]

หน้าซื้อ

    Should Contain  ${Page buy}  Trade
    Should Contain  //span[@class="value"]    ${ใส่ราคา}
    execute javascript  window.scrollTo(0, 500)

หน้าออเดอร์

    Click Element  //a[@href="http://localhost:7600/user/trade-requests"]

หน้าเสร็จสิ้นออเดอร์

    Click Element  //a[@href="http://localhost:7600/user/trade-requests"]
    sleep  2s
    Click Element   //*[@id="nav-profile-tab"]
    sleep  1s
    Click Element     //*[@id="nav-profile"]/div[1]/table/tbody/tr[1]/td[8]/a
    
    

จัดการออเดอร์

    Click Element   //*[@id="nav-home"]/div[1]/table/tbody/tr[1]/td[10]/a
    Page Should Contain  admin222
    execute javascript  window.scrollTo(0, 700)
    Input Text  //textarea[@name="message"]  พร้อมครับ
    Sleep      1s
    Click Element  //button[@id="send-chat-btn"] 
    
เข้าการสร้างร้านค้า

    Mouse Over       //*[@id="navbarSupportedContent"]/div/ul/li
    Click Element    //a[@href="http://localhost:7600/user/advertisements"]
    Page Should Contain    My Advertisement

สร้างร้านค้าซื้อ
    [Arguments]    ${MIN}    ${MAX}    ${Detail}
    Click Element    //a[@class="cmn-btn2 btn-md"]
    Select From List By Label   //select[@name="type"]   Buy
    execute javascript  window.scrollTo(0, 100)
    Select From List By Label   //select[@id="fiat-currency"]  THB
    execute javascript  window.scrollTo(0, 200)
    Input Text    //input[@id="min"]    ${MIN}    
    Input Text    //input[@id="max"]    ${MAX}
    execute javascript  window.scrollTo(0, 300)
    Input Text    //textarea[@id="detail"]   ${Detail}
    execute javascript  window.scrollTo(0, 1000)
    sleep  1s
    Click Button    //button[@id="publish-btn"]

สร้างร้านค้าขาย
    [Arguments]    ${MIN}    ${MAX}    ${Detail}
    Click Element    //a[@class="cmn-btn2 btn-md"]
    Select From List By Label   //select[@name="type"]  Sell
    execute javascript  window.scrollTo(0, 100)
    Select From List By Label   //select[@id="fiat-currency"]  THB
    execute javascript  window.scrollTo(0, 200)
    Input Text    //input[@id="min"]    ${MIN}    
    Input Text    //input[@id="max"]    ${MAX}
    execute javascript  window.scrollTo(0, 300)
    Input Text    //textarea[@id="detail"]   ${Detail}
    execute javascript  window.scrollTo(0, 1000)
    sleep  1s
    Click Button    //button[@id="publish-btn"]

ปิดร้านค้า
    Sleep    2s
    Click Element     //tr[1]/td[8]/a[1 and @class="text-light statusBtn icon-btn-sm btn btn-danger"]
    Click Button     //button[@type="submit"]
    Page Should Contain     Deactive

ลืมรหัสผ่าน
    Sleep    0.5s
    Execute Javascript    window.scrollTo(0, 100)
    Click Link   //a[@href="http://localhost:7600/password/reset"]
    execute javascript    window.scrollTo(0, 500)
    Input Text    //input[@type="text"]   ${ID}
    Click Button    //button[@class="cmn-btn"]

    




    

    




   
    
   








