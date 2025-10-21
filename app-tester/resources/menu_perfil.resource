*** Settings ***
Resource  ../common/main.resource

*** Variables ***
${PERFIL_CIDADAO}    //android.widget.TextView[@text="Perfil Cidadão"]
${PERFIL_TIPO_CIDADAO}    //android.widget.TextView[@text="Perfil"]
${PERFIL_TIPO_SERVIDOR}    //android.widget.TextView[@text="Servidor"]
${TELA_CHEIA}    //android.view.ViewGroup[@content-desc="MARIA FARIAS DE BARROS, kfdfkdg@fjlgf.com"]
${PERFIL_CIDADAO_OPCAO}    //android.widget.TextView[@text="Cidadão"]
${PERFIL_SERVIDOR_OPCAO}    //android.widget.TextView[@text="Servidor"]
${PERFIL_SERVIDOR}    //android.widget.TextView[@text="Perfil Servidor"]
${BTN_SAIR}    //android.widget.TextView[@text="SAIR"]
${BTN_PREFERENCIAS}    //android.widget.TextView[@text="Preferências"]
${VERSAO_APP}    //android.widget.TextView[@text="Sobre o MT.Cidadão"]
${CERTIFICADO_MTID}    //android.widget.TextView[@text="Certificado MT.id"]
${BTN_VOLTAR}    //android.widget.ImageButton[@content-desc="Navigate Up"]
${CADASTRO_MTLOGIN}    //android.widget.TextView[@text="Cadastro MT.Login"]
${DADOS_MTLOGIN}    //android.widget.TextView[@text="Meus Dados"]
${PRIVACIDADE}    //android.widget.TextView[@text="Política de privacidade"]
${PRIVACIDADE_EXT}    //android.view.View[@resource-id="h.INITIAL_GRID.emy7jy1kqopo"]/android.view.View/android.view.View
${MENU_SERVICOS}    //android.widget.FrameLayout[@content-desc="Serviços, tab, 2 out of 4"]
${BUSCA_SERVICOS}    //android.widget.EditText[@text="Qual serviço você quer buscar?"]
${ORGAOS}    //android.widget.TextView[@text="Órgãos"]
${CATEGORIAS}    //android.widget.TextView[@text="Categorias"]
${MENU_DUVIDAS}    //android.widget.FrameLayout[@content-desc="Dúvidas, tab, 4 out of 4"]
${TELA_DUVIDAS}    //android.webkit.WebView

*** Keywords ***
usuário tenha cadastro válido e apenas perfil cidadão
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}    

o usuário efetua login e clica no ícone com a inicial do nome
    VAR    ${MENU_INICIAL_NOME}    //android.widget.TextView[@text="${letra}"]   
    Wait Until Element Is Visible    ${MENU_INICIAL_NOME}
    Click Element    ${MENU_INICIAL_NOME}

o sistema apresenta o menu lateral completo e contendo apenas perfil de cidadão
    Wait Until Element Is Visible    ${PERFIL_TIPO_CIDADAO}
    Sleep    3s
    Page Should Not Contain Element    ${PERFIL_TIPO_SERVIDOR}
    Capture Page Screenshot    perfil_cidadao
    Press Keycode    4
    
usuário tenha cadastro válido e perfil servidor    
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}
    
o sistema apresenta o menu lateral completo e contendo perfil de servidor
    Wait Until Element Is Visible    ${PERFIL_TIPO_SERVIDOR}
    Capture Page Screenshot    perfil_servidor
    Press Keycode    4

o usuário clica na opção cidadao
    Wait Until Element Is Visible    ${PERFIL_CIDADAO_OPCAO}
    Click Element    ${PERFIL_CIDADAO_OPCAO}

o sistema direciona para a home do tema cidadão contendo respectivos serviços e documentos
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}
    Capture Page Screenshot    home_cidadao

o usuário clica na opção servidor
    Wait Until Element Is Visible    ${PERFIL_SERVIDOR_OPCAO}
    Click Element    ${PERFIL_SERVIDOR_OPCAO}

o sistema direciona para home do tema servidor contendo respectivos serviços e documentos
    Wait Until Element Is Visible    ${PERFIL_SERVIDOR}
    Capture Page Screenshot    home_servidor

o usuário tenha cadastro válido
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}

o sistema apresenta a opção Sair no menu lateral direito
    Wait Until Element Is Visible    ${BTN_SAIR}
    Capture Page Screenshot    clicou_sair
    Press Keycode    4

o usuário clica na opção Preferências
    Wait Until Element Is Visible    ${BTN_PREFERENCIAS}
    Click Element    ${BTN_PREFERENCIAS}

o sistema apresenta a tela de Preferências do aplicativo
    Wait Until Element Is Visible    ${VERSAO_APP}
    Capture Page Screenshot    preferencias_app
    Click Element    ${BTN_VOLTAR}
o usuário clica na opção Certificado MT.id
    Wait Until Element Is Visible    ${CERTIFICADO_MTID}
    Click Element    ${CERTIFICADO_MTID}

botão deve estar desabilitado e o sistema não permite a ação
    Wait Until Element Is Visible    ${VERSAO_APP}
    Capture Page Screenshot    certificado_mtid_desabilitado
    Click Element    ${BTN_VOLTAR}

o sistema apresenta a tela com informações sobre MT.id

apresenta a opção para cancelar o certificado no aparelho

o usuário clica na opção Cadastro MT.Login
    Wait Until Element Is Visible    ${CADASTRO_MTLOGIN}
    Click Element    ${CADASTRO_MTLOGIN}

o sistema direciona para a tela de dados do MT.Login no navegador externo
    Sleep    3S
    Wait Until Element Is Visible    ${DADOS_MTLOGIN}
    Capture Page Screenshot    dados_mtlogin
    Press Keycode    4
    Click Element    ${BTN_VOLTAR}

o usuário clica na opção Política de Privacidade
    Wait Until Element Is Visible    ${PRIVACIDADE}
    Click Element    ${PRIVACIDADE}

o sistema direciona para a tela de política de privacidade no navegador externo
    Sleep    3S
    Wait Until Element Is Visible    ${PRIVACIDADE_EXT}
    Capture Page Screenshot    politica_privacidade
    Press Keycode    4
    Click Element    ${BTN_VOLTAR}

o usuário tenha cadastro válido e esteja logado no aplicativo
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}

o usuário clica na opção Serviços do menu inferior
    Wait Until Element Is Visible    ${MENU_SERVICOS}
    Click Element    ${MENU_SERVICOS}

o sistema direciona para a tela de serviços para busca livre
    Wait Until Element Is Visible    ${BUSCA_SERVICOS}
    Capture Page Screenshot    tela_servicos

mostra lista de órgãos e categorias para seleção
    Wait Until Element Is Visible    ${ORGAOS}
    Wait Until Element Is Visible    ${CATEGORIAS}
    Capture Page Screenshot    tela_servicos_orgaos_categorias
    
o aplicativo esteja aberto na tela de login
    Wait Until Element Is Visible    ${PERFIL_CIDADO}

o usuário clica na opção Dúvidas no menu inferior
    Wait Until Element Is Visible    ${MENU_DUVIDAS}
    Click Element    ${MENU_DUVIDAS}

o sistema direciona para a tela de dúvidas
    Wait Until Element Is Visible    ${TELA_DUVIDAS}
    Sleep    10s
    Capture Page Screenshot  tela_duvidas.png