*** Settings ***
Documentation    Exercício 2 Robot - Form Authentication
...              Criar um novo Arquivo formAuthSimple.robot 
...              Abrir o site https://the-internet.herokuapp.com/
...              Criar um Teste para "Form Authentication"
...              workshop Zé Delivery + Test Girls

Library    SeleniumLibrary

*** Variables ***
${URL_PRINCIPAL}        https://the-internet.herokuapp.com/
${URL_LOGIN}            https://the-internet.herokuapp.com/login
${USERNAME}             id:username                                                                         
${PASSWORD}             id:password
${BUTTON_LOGIN}         xpath=//button[@class='radius' and @type='submit']
${MSG_SUCESS_LOGIN}     xpath=//*[@id="flash" and contains(text(),"You logged into a secure area!")]
${MSG_SUCESS_LOGOUT}    xpath=//*[@id="flash" and contains(text(),"You logged out of the secure area!")]
${BUTTON_LOGOUT}        link:Logout

*** Keywords ***
Abrir o Navegador
    Open Browser               ${URL_PRINCIPAL}    chrome
    Maximize Browser Window

Realiza Login com Sucesso
    Click Element                  ${USERNAME}
    Input Text                     ${USERNAME}              tomsmith
    Click Element                  ${PASSWORD}
    Input Text                     ${PASSWORD}              SuperSecretPassword!
    Click Element                  ${BUTTON_LOGIN}

Valida Mensagem de Sucesso de Login
    Page Should Contain Element    ${MSG_SUCESS_LOGIN}  

Realiza Logout 
    Click Element                  ${BUTTON_LOGOUT}    

Valida Mensagem de Sucesso de Logout
    Page Should Contain Element    ${MSG_SUCESS_LOGOUT} 
    Capture Page Screenshot 

*** Test Cases ***
Cenário de teste 01 - Inserir um usuário e senha válidos
    Abrir o Navegador
    Go To                          ${URL_LOGIN} 
    Page Should Contain            Login Page
    Realiza Login com Sucesso
    Valida Mensagem de Sucesso de Login
    Realiza Logout 
    Valida Mensagem de Sucesso de Logout
    Close Browser                  

