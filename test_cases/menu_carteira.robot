*** Settings ***
Resource    ../common/main.resource
# Test Setup    Setup Com Login    usuario_login=&{USUARIO}
Test Teardown   fechar app


*** Test Cases ***
Cenario 1 : Visualizar Carteira quando usuário não emitiu nenhum documento
    [Tags]  sem_documento
    Dado que vejo o painel do cidadão logado
    Quando o usuário clica na opção Carteira do Menu Inferior
    Então o sistema apresenta tela carteira com imagem e informação de que não há documentos salvos

Cenario 2 : Visualizar Carteira quando usuário emitiu um ou mais documentos
    [Tags]  lista_cards
    Dado que vejo o painel do cidadão logado
    Quando o usuário clica na opção Carteira do Menu Inferior
    Então o sistema apresenta tela carteira contendo mensagem sobre carteira offline e lista de cards dos documentos emitidos pelo usuário

Cenario 3 : Visualizar Carteira quando usuário emitiu CRLV
    [Tags]  crlv
    Dado que vejo o painel do cidadão logado
    Quando o usuário clica na opção Carteira do Menu Inferior
    Então o sistema apresenta a tela de Carteira contendo card do CRLV contendo dados do Carro

Cenario 4 : Compartinhar CRLV a partir da tela Documentos
    [Tags]  compartilhar_crlv
    Dado que o usuário tenha visualizado card do CRLV na tela Carteira
    Quando o usuário clica no ícone Compartilhar do card
    Então o sistema apresenta bandeja de compartilhamento CRLV
    
Cenario 5: Atualizar CRLV a partir da tela Documentos
    [Tags]  atualizar_crlv
    Dado que o usuário tenha visualizado card do CRLV na tela menu Carteira
    Quando o usuário clica no ícone Atualizar do card
    Então o sistema exibe um modal de atualizar o card

Cenario 6: Excluir CRLV a partir da tela Documentos
    [Tags]  excluir_crlv
    Dado que o usuário tenha visualizado card do CRLV no menu carteira
    Quando o usuário clica no icone excluir card
    Então sistema exibe a modal de exclusão

Cenario 7: Visualizar Carteira quando usuário emitiu Carteirinha do Autista
    [Tags]  visualizar_autista
    Dado que o usuário tenha acessado o menu carteira
    Então o sistema exibe a carteira de Autismo

Cenario 8: Compartinhar Carteirinha do Autista a partir da tela Documentos
    [Tags]  compartilhar_autista    
    Dado que o usuário tenha visualizado a Carteira de Autista
    Quando o usuário clica no ícone Compartilhar Carteira de Autismo
    Então o sistema apresenta bandeja de compartilhamento da Carteira de Autista  

Cenario 9: Atualizar Carteirinha do Autista a partir da tela Documentos
    [Tags]  atualizar_autista
    Dado que o usuário tenha visualizado uma Carteira de Autista
    Quando o usuário clica no ícone atualizar Carteira de Autismo
    Então o sistema apresenta modal de Atualização do Card  

Cenario 10: Abrir Carteirinha do Autista na tela Documentos
    [Tags]  abrir_carteira_autista
    Dado que o usuário tenha visualizado Carteira de Autista na tela documentos
    Quando o usuário clica no ícone abrir Carteira de Autismo
    Então o sistema exibe a carteirinha de autista

Cenario 11: Compartilhar RG a partir da tela Documentos 
    [Tags]  compartilhar_rg 
    Dado que o usuário tenha visualizado Carteira RG
    Quando o usuário clica no ícone compartihar rg
    Então o sistema apresenta bandeja de compartilhamento RG 

Cenario 12: Atualizar RG a partir da tela Documentos
    [Tags]  atualizar_rg
    Dado que o usuário tenha visualizado rg na Tela Documentos
    Quando o usuário clica no ícone atualizar rg
    Então o sistema exibe modal de Atualização da RG   

Cenário 13: Abrir RG na tela Documentos
    [Tags]  abrir_rg
    Dado que o usuário tenha visualizado rg na Tela Documentos
    Quando o usuário clica no ícone abrir do respectivo documento
    Então o sistema exibe a carteira de RG

Cenário 14: Visualizar segunda página do RG na tela Documentos
    [Tags]  pagina2_rg
    Dado que o usuário tenha visualizado rg na Tela Documentos
    Quando o usuário clica no ícone abrir do respectivo documento
    E desliza para a segunda página do carrossel
    Então o sistema exibe a segunda página do RG

Cenário 15: Visualizar QRCode do RG na tela Documentos
    [Tags]  qrcode_rg
    Dado que o usuário tenha visualizado rg na Tela Documentos
    Quando o usuário clica no ícone abrir do respectivo documento
    # E desliza para a segunda página do carrossel
    E desliza para a terceira página do carrossel
    Então o sistema exibe o QRCode do RG

Cenário 16: Visualizar Carteira quando usuário emitiu carteirinha do MT Saúde
    [Tags]  visualizar_mt_saude
    [Setup]    Setup Com Login    usuario_login=&{USUARIO_MT_SAUDE}
    Dado que o usuário possui carteirinha do MT Saúde
    Quando o usuário acessa o menu carteira
    Então o sistema exibe a carteirinha do MT Saúde com nome completo
    E são exibidos os ícones de compartilhar, atualizar e excluir
   
Cenário 17: Compartinhar Carteirinha do MT Saúde a partir da tela Documentos
    [Tags]  compartilhar_mt_saude   
    [Setup]    Setup Com Login    usuario_login=&{USUARIO_MT_SAUDE} 
    Dado que o usuário tenha visualizado a Carteirinha do MT Saúde
    Quando o usuário clica no ícone Compartilhar da Carteirinha do MT Saúde
    Então o sistema apresenta bandeja de compartilhamento da Carteirinha do MT Saúde

Cenário 18: Atualizar Carteirinha do MT Saúde a partir da tela Documentos
    [Tags]  atualizar_mt_saude    
    [Setup]    Setup Com Login    usuario_login=&{USUARIO_MT_SAUDE}
    Dado que o usuário tenha visualizado a Carteirinha do MT Saúde
    Quando o usuário clica no ícone atualizar da Carteirinha do MT Saúde    
    Então o sistema apresenta modal de Atualização do Card da carteirinha

Cenário 19: Abrir carteirinha de saúde na tela Documentos
    [Tags]  abrir_mt_saude
    [Setup]    Setup Com Login    usuario_login=&{USUARIO_MT_SAUDE}
    Dado que o usuário tenha visualizado card da Carteirinha do MT Saúde na tela documentos
    Quando o usuário clica no ícone abrir da carteirinha de saúde
    Então o sistema exibe a carteirinha de saúde do usuário

