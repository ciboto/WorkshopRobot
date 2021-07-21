*** Settings ***
Documentation    Exercício 2.2 Robot - Form Authentication
...              Criar um novo Arquivo formAuthAdvanced.robot 
...              Abrir o site https://the-internet.herokuapp.com/
...              Criar cenários altenativos de testes para "Form Authentication"
...              workshop Zé Delivery + Test Girls

Library          SeleniumLibrary

#Esses comandos são executados no começo e fim de casa cénario de teste
Test Setup       Abrir o Navegador
Test Teardown    Fecha Navegador      

*** Variables ***
#Variaveis de URL
${URL_PRINCIPAL}             https://the-internet.herokuapp.com/
${URL_LOGIN}                 https://the-internet.herokuapp.com/login

#Variaveis dos campos
${USERNAME}                  id:username                                                                         
${PASSWORD}                  id:password

#Variaveis de Botões
${BUTTON_LOGIN}              xpath=//button[@class='radius' and @type='submit']
${BUTTON_LOGOUT}             link:Logout

#Variaveis de Mensagens de SUCESSO e ERRO
${MSG_SUCESS_LOGIN}          xpath=//*[@id="flash" and contains(text(),"You logged into a secure area!")]
${MSG_SUCESS_LOGOUT}         xpath=//*[@id="flash" and contains(text(),"You logged out of the secure area!")]
${MSG_ERROR_USER_INVALID}    xpath=//*[@id="flash" and contains(text(),"Your username is invalid!")]
${MSG_ERROR_PASS_INVALID}    xpath=//*[@id="flash" and contains(text(),"Your password is invalid!")]

*** Keywords ***
Abrir o Navegador
    Open Browser               ${URL_PRINCIPAL}    chrome
    Maximize Browser Window

Fecha Navegador
    Capture Page Screenshot
    Close Browser

#Keywords criadas em formato BDD :)
Dado que estou na tela de Login
    Go To                  ${URL_LOGIN} 
    Page Should Contain    Login Page

Quando realizo o Login com Sucesso
    Click Element    ${USERNAME}
    Input Text       ${USERNAME}        tomsmith
    Click Element    ${PASSWORD}
    Input Text       ${PASSWORD}        SuperSecretPassword!
    Click Element    ${BUTTON_LOGIN}

Então obtenho a mensagem de Login com Sucesso
    Page Should Contain Element    ${MSG_SUCESS_LOGIN}    

E realizo o Logout
    Click Element    ${BUTTON_LOGOUT}    

E obtenho a mensagem de Logout com Sucesso
    Page Should Contain Element    ${MSG_SUCESS_LOGOUT} 

Quando insiro Usuário e Senha inválidos
    Click Element    ${USERNAME}
    Input Text       ${USERNAME}        teste
    Click Element    ${PASSWORD}
    Input Text       ${PASSWORD}        teste
    Click Element    ${BUTTON_LOGIN}

Quando insiro Usuário Válido e Senha inválida
    Click Element    ${USERNAME}
    Input Text       ${USERNAME}        tomsmith
    Click Element    ${PASSWORD}
    Input Text       ${PASSWORD}        teste
    Click Element    ${BUTTON_LOGIN}

Quando Não insiro usuário e senha
    Click Element    ${BUTTON_LOGIN}

Então recebo mensagem de Erro de Usuário
    Page Should Contain Element    ${MSG_ERROR_USER_INVALID} 

Então recebo mensagem de Erro de Senha
    Page Should Contain Element    ${MSG_ERROR_PASS_INVALID} 



*** Test Cases ***
Cenário de teste E2E - Realizo Login e Logout
    Dado que estou na tela de Login
    Quando realizo o Login com Sucesso
    Então obtenho a mensagem de Login com Sucesso
    E realizo o Logout 
    E obtenho a mensagem de Logout com Sucesso

Cenário de teste 01 - Inserir um usuário e senha válidos
    Dado que estou na tela de Login
    Quando realizo o Login com Sucesso
    Então obtenho a mensagem de Login com Sucesso


Cenário de teste 02 - Inserir um usuário e senha inválidos
    Dado que estou na tela de Login
    Quando insiro Usuário e Senha inválidos
    Então recebo mensagem de Erro de Usuário


Cenário de teste 03 - Inserir um usuário válido e senha inválida
    Dado que estou na tela de Login
    Quando insiro Usuário Válido e Senha inválida
    Então recebo mensagem de Erro de Senha           

Cenário de teste 04 - Não insere nenhum dado
    Dado que estou na tela de Login
    Quando Não insiro usuário e senha
    Então recebo mensagem de Erro de Usuário