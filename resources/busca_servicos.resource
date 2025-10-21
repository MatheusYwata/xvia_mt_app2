*** Settings ***
Resource  ../common/main.resource

*** Variables ***
${INICIO_IMG}    //android.widget.TextView[@text="Inovar e transformar para facilitar"]
${VEJA_ORGAOS}    //android.view.ViewGroup[@content-desc="VEJA TODOS OS ÓRGÃOS"]
${LISTA_ORGAOS}    //android.widget.TextView[@text="CASA CIVIL - CASA CIVIL"]
${LISTA_CATEGORIAS}    //android.widget.TextView[@text="Administração Pública"]
${BTN_CATEGORIAS}    //android.view.ViewGroup[@content-desc="Categorias"]
${PESQUISAR}    //android.widget.EditText[@text="Qual serviço você quer buscar?"]
${SEGUNDA_VIA}    //android.widget.TextView[@text="Solicitar Segunda Via da Carteira Nacional de Habilitação - CNH"]
${TERMO_ORGAO}    //android.widget.TextView[@text="ACESSO REMOTO -  DETRAN"]
${TERMO_CATEGORIA}    //android.widget.TextView[@text="Buscar Atividades de Formação à Educação em Direitos Humanos"]
${TERMO_BOTAO}    //android.view.ViewGroup[@content-desc="ACESSAR O SERVIÇO DIGITAL"]
${MODAL_LOGIN}    //android.widget.TextView[@text="Requisito para acesso"]
${BTN_VOLTAR_INICIO}    //android.widget.TextView[@text="VOLTAR PARA INICIO"]

*** Keywords ***

########Carregamento da lista de órgãos não logado
o usuário tenha instalado o aplicativo
    Wait Until Element Is Visible    ${INICIO_IMG}

clicar em Veja todos os órgãos ou seleciona a opção órgãos
    Swipe    500    1500    500    500    1000    
    Swipe    500    1500    500    500    1000
    Wait Until Element Is Visible    ${VEJA_ORGAOS}
    Click Element    ${VEJA_ORGAOS}

 o sistema apresenta a lista de órgãos
    Wait Until Element Is Visible    ${LISTA_ORGAOS}
    Capture Page Screenshot    lista_orgaos.png
    Press Keycode    4

########Carregamento da lista de categorias não logado
clicar em Veja todos os órgãos e seleciona a opção categorias
    Swipe    500    1500    500    500    1000
    Swipe    500    1500    500    500    1000
    Wait Until Element Is Visible    ${VEJA_ORGAOS}
    Click Element    ${VEJA_ORGAOS}
    Click Element    ${BTN_CATEGORIAS}

o sistema apresenta a lista de categorias
    Wait Until Element Is Visible    ${LISTA_CATEGORIAS}
    Capture Page Screenshot    lista_categorias.png
    Press Keycode    4

########Pesquisa livre não logado com termo da carta de serviços 
clicar em Veja todos os órgãos
    Swipe    500    1500    500    500    1000
    Swipe    500    1500    500    500    1000
    Wait Until Element Is Visible    ${VEJA_ORGAOS}
    Click Element    ${VEJA_ORGAOS}

o usuário digita um termo da carta de serviços
    Wait Until Element Is Visible    ${PESQUISAR}
    Input Text    ${PESQUISAR}    segunda via
    
o sistema apresenta retorno conforme busca do catalogo portal de serviços
    Wait Until Element Is Visible    ${SEGUNDA_VIA}
    Capture Page Screenshot    pesquisa_carta_servicos.png   
    Press Keycode    4

########Pesquisa livre não logado com termo de órgão
o usuário digita um termo de órgão
    Wait Until Element Is Visible    ${PESQUISAR}
    Input Text    ${PESQUISAR}    detran

o sistema apresenta retorno conforme busca do catalogo de orgaos
    Wait Until Element Is Visible    ${TERMO_ORGAO}
    Capture Page Screenshot    pesquisa_orgaos.png
    Press Keycode    4

########Pesquisa livre na lista de categorias não logado
o usuário digita um termo de categoria
    Wait Until Element Is Visible    ${PESQUISAR}
    Input Text    ${PESQUISAR}    educacao

o sistema apresenta retorno conforme busca do catalogo de categorias    
    Wait Until Element Is Visible    ${TERMO_CATEGORIA}
    Capture Page Screenshot    pesquisa_categorias.png
    Press Keycode    4

########Pesquisa livre na lista de serviços/botões não logado
o usuário digita um termo referente a botão cadastrado no app
    Wait Until Element Is Visible    ${PESQUISAR}
    Input Text    ${PESQUISAR}    reclamacao

o sistema retorna o botão corretamente
    Wait Until Element Is Visible    ${TERMO_BOTAO}
    Capture Page Screenshot    pesquisa_botao.png
    Press Keycode    4

########Clicar no botão após pesquisa quando usuário não logado
o usuário tenha tenha efetuado pesquisa com retorno de botão
    Wait Until Element Is Visible    ${INICIO_IMG}    10s
    Swipe    500    1500    500    500    1000
    Swipe    500    1500    500    500    1000
    Wait Until Element Is Visible    ${VEJA_ORGAOS}
    Click Element    ${VEJA_ORGAOS}
    Wait Until Element Is Visible    ${PESQUISAR}
    Input Text    ${PESQUISAR}    reclamacao
    Wait Until Element Is Visible    ${TERMO_BOTAO}

o usuário clicar no botão
    Click Element    ${TERMO_BOTAO}

a aplicação exibe mensagem informando que usuário será direcionado para a tela de login
    Wait Until Element Is Visible    ${MODAL_LOGIN}

E mostra botão Voltar para o início
    Wait Until Element Is Visible    ${BTN_VOLTAR_INICIO}
    Capture Page Screenshot    clicar_botao.png
    Press Keycode    4

########Voltar para tela inicial do app após pesquisa de botão quando usuário não logado
o usuário clicar em Voltar para o início
    Click Element    ${BTN_VOLTAR_INICIO}

a aplicação retorna para tela inicial do app
    Wait Until Element Is Visible    ${INICIO_IMG}
    Capture Page Screenshot    voltar_inicio.png
    Press Keycode    4

########Clicar em acessar serviço após pesquisa quando usuário não logado

o usuário tenha tenha efetuado pesquisa com retorno de serviço
    o usuário tenha tenha efetuado pesquisa com retorno de botão

o usuário clicar em Acessar o serviço digital
    o usuário clicar no botão

mostra botão Voltar para o início
    Wait Until Element Is Visible    ${BTN_VOLTAR_INICIO}
    Capture Page Screenshot    acessar_servico.png
    Press Keycode    4

# ########Voltar para tela inicial do app após pesquisa de botão quando usuário não logado
# o usuário tenha efetuado pesquisa com retorno de serviço que possua botão "Acessar Serviço Digital" e clique nele
#     Wait Until Element Is Visible    ${INICIO_IMG}    10s
#     Swipe    500    1500    500    500    1000
#     Swipe    500    1500    500    500    1000
#     Swipe    500    1500    500    500    1000
#     Wait Until Element Is Visible    ${VEJA_ORGAOS}
#     Click Element    ${VEJA_ORGAOS}
#     Wait Until Element Is Visible    ${PESQUISAR}
#     Input Text    ${PESQUISAR}    reclamacao
#     Wait Until Element Is Visible    ${TERMO_BOTAO}
#     Click Element    ${TERMO_BOTAO}

# sistema tenha apresentado mensagem com botão "Voltar para o Início"
#     Wait Until Element Is Visible    ${MODAL_LOGIN}
#     Wait Until Element Is Visible    ${BTN_VOLTAR_INICIO}

# o usuário clica no botão "Voltar para o Início"
#     Click Element    ${BTN_VOLTAR_INICIO}

# a aplicação retorna para a tela inicial do app
#     Wait Until Element Is Visible    ${INICIO_IMG}
#     Capture Page Screenshot    voltar_inicio_servico.png
#     Press Keycode    4