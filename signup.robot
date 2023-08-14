*** Settings ***
Documentation        Cenários de testes cadastro de usuários


Resource        ../resources/base.robot

*** Test Cases ***
Deve poder cadastrar um novo usuário

    ${name}        Set Variable        Noah Gallo
    ${email}       Set Variable        noahgallo@gmail.com
    ${wrongemail}    Set Variable    noahgallo123@gmail.com
    ${password}    Set Variable        yass1234
    ${wrongpassword}    Set Variable        yass123456
    ${firstname}    Set Variable     Noah
    ${lastname}    Set Variable     Gallo
    ${address}    Set Variable    rua ana,50
    ${state}    Set Variable     pe
    ${city}    Set Variable    olinda  
    ${zipcode}    Set Variable     53123654
    ${mobile_number}    Set Variable  8112345678

    Start Session

    Go To         https://www.automationexercise.com/

    Wait For Elements State    css=h1    visible        5
    Get Text                   css=h1    equal          New User Signup!

    Fill Text    id=name        ${name}
    Fill Text    id=email       ${email}

    Click    id=signup-button

    Wait For Elements State    css=.notice p    visible        5
    Get Text                   css=.notice p    equal          ENTER ACCOUNT INFORMATION
  
    Fill Text    id=password    ${password}

    Get Text                   css=.notice p    equal          ADDRESS INFORMATION

    Fill Text    id=first_name        ${firstname}
    Fill Text    id=last_name       ${lastname}    
    Fill Text    id=address1        ${address}
    Fill Text    id=state        ${state}
    Fill Text    id=city        ${city}    
    Fill Text    id=zipcode        ${zipcode}
    Fill Text    id=mobile_number        ${mobile_number}     

    Click    id=create_account

    Wait For Elements State    css=.notice p    visible        5
    Get Text                   css=.notice p    equal          ACCOUNT CREATED!

    Click    id=continue-button


Não deve permitir o cadastro com email duplicado
    
    Start Session

    Go To         https://www.automationexercise.com/
 
    Wait For Elements State    css=h1    visible        5
    Get Text                   css=h1    equal          New User Signup!

    Fill Text    id=name        ${name}     
    Fill Text    id=email       ${email}
    
    Click    id=signup-button

    Wait For Elements State    css=.notice p    visible        5
    Get Text                   css=.notice p    equal          Email Address already exist!
 

Fazendo login com informações corretas

    Start Session

    Go To         https://www.automationexercise.com/
 
    Wait For Elements State    css=h1    visible        5
    Get Text                   css=h1    equal          Login to your account
  
    Fill Text    name=email       ${email}
    Fill Text    name=password       ${password}
    
    Click    id=login-button

Fazendo login com informações erradas

    Start Session

    Go To         https://www.automationexercise.com/
 
    Wait For Elements State    css=h1    visible        5
    Get Text                   css=h1    equal          Login to your account
  
    Fill Text    name=email       ${wrongemail}
    Fill Text    name=password       ${wrongpassword}
    
    Click    id=login-button

    Wait For Elements State    css=.notice p    visible        5
    Get Text                   css=.notice p    equal          Your email or password is incorrect!