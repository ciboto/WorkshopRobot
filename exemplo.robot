*** Settings *** 
Documentation       Apresentação do Robot Framework Maneiro
...     Abrir o Google 
...     workshop Zé Delivery + Test Girls

Library     SeleniumLibrary

*** Variables ***
${url}      https://www.google.com.br 

*** Keywords ***
Abrir o Navegador
    Open Browser   ${url}   chrome
    Maximize Browser Window

*** Test Cases ***
Cenário de teste 01 - Abrir o Google tirar um print e fechar browser :)
    Abrir o Navegador
    Capture Page Screenshot
    Close Browser   

