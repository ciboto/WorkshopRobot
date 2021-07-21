*** Settings *** 
Documentation       Exercício 1 Robot - Forgot Password
...     Criar um novo Arquivo forgotPassword.robot 
...     Abrir o site https://the-internet.herokuapp.com/
...     Criar um Teste para "Forgot Password"
...     workshop Zé Delivery + Test Girls

Library     SeleniumLibrary

*** Variables ***
${URL_PRINCIPAL}                  https://the-internet.herokuapp.com/
${URL_FORGOT_PASS}                https://the-internet.herokuapp.com/forgot_password
${EMAIL}                          id:email  
${BUTTON}                         id:form_submit  

*** Keywords ***
Abrir o Navegador
    Open Browser   ${URL_PRINCIPAL}   chrome
    Maximize Browser Window

*** Test Cases ***
Cenário de teste 01 - Inserir um E-mail no Forgot Password
    Abrir o Navegador
    Go To  ${URL_FORGOT_PASS} 
    Page Should Contain     Forgot Password
    Click Element           ${EMAIL}
    Input Text              ${EMAIL}    teste@teste.com.br
    Click Element           ${BUTTON}
    Capture Page Screenshot
    Close Browser   

