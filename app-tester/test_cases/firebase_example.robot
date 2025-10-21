*** Settings ***
Resource  ../shared/setup_teardown_firebase.resource
Resource  ../resources/login.resource
Resource  ../data/credenciais.resource

*** Test Cases ***
Login With Latest APK From Firebase
    [Documentation]    Downloads the latest APK from Firebase and runs login test
    [Tags]    firebase    login
    
    # Download APK from Firebase Storage
    Download APK From Firebase
    
    # Run test using the downloaded APK
    abrir app
    faço login com o cpf e data de nascimento    ${CPF}    ${DATA_NASCIMENTO}
    seleciono o icone do usuario
    tiro print da tela
    fechar app