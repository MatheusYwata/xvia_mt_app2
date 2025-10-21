*** Settings ***
Resource  ../common/main.resource

*** Variables ***
${HOME_PAGE}        //android.widget.ImageView
${BOTAO_ENTRAR}    //android.widget.TextView[@text="ENTRAR COM"]
${MT_LOGIN}        //android.widget.Button[@text="ENTRAR COM MT LOGIN"]
${FIELD_CPF}           //android.widget.EditText[@resource-id="username"]
${FIELD_CPF_V2}        //android.widget.EditText[@resource-id=":r5:"]
${FIELD_PASSWORD}      //android.widget.EditText[@resource-id="password"]
${BTN_ENTRAR}    //android.widget.Button[@text="ENTRAR"]
${BTN_ENTRAR_2}    //android.widget.Button[@resource-id="kc-login"]
${PERMITIR}      com.android.packageinstaller:id/permission_allow_button
${PERFIL_CIDADAO}   //android.widget.TextView[@text="Perfil Cidadão"]
${VEJA_MAIS}    //android.view.ViewGroup[@content-desc="Veja mais"]/android.view.ViewGroup/android.view.ViewGroup
${SERVICOS_DISPONIVEIS}   //android.widget.TextView[@text="Serviços digitais disponíveis"]
${SUGESTAO}   //android.widget.TextView[@text="Não encontrou o serviço digital do qual gostaria?"]
${FORMULARIO}   //android.widget.TextView[@text="MT Cidadão: Mato Grosso de mãos dadas com o cidadão"]
${MEUS_DOCUMENTOS}   //android.widget.TextView[@text="Meus documentos"]
${CNH_CARD}   //android.widget.TextView[@text="Carteira Nacional de Habilitação"]
${INFO_CNH}   //android.widget.TextView[@text="Acompanhamentos"]
${CARD_CELIACO}   //android.widget.TextView[@text="Carteira do Celíaco"]                       
${INFO_CELIACO}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${BTN_CELIACO}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup
${CARTEIRA}   //android.widget.FrameLayout[@content-desc="Carteira, tab, 3 out of 4"]
${CARD_RG}   //android.widget.TextView[@text="Registro de Identificação Civil (RG)"]
${PERFIL_CIDADAO}   //android.widget.TextView[@text="Perfil Cidadão"]
${BTN_SERVIDOR}   //android.view.ViewGroup[@content-desc="Servidor"]/android.view.ViewGroup
${PERFIL_SERVIDOR}    //android.widget.TextView[@text="Perfil Servidor"]
${SERVIDOR_CARD}   //android.view.ViewGroup[@content-desc="Identidade do Servidor, Nome Completo, JUCELIA DA COSTA, Matrícula, 226875, Vínculo, 1, Cargo, PROF. EDUC. BASICA"]/android.view.ViewGroup
${CARTEIRA_SERVIDOR}   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView


*** Keywords ***
o usuario esteja na Home do APP 
    Sleep   5s
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}
    # clicar no botão permitir


o usuario clicar no botao entrarCom
    Sleep    5s
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}
    Click Element  ${BOTAO_ENTRAR}
    clicar no botão permitir
    
clicar no botao entrar com MT login
    Wait Until Element Is Visible    ${MT_LOGIN}  timeout=5s
    Click Element  ${MT_LOGIN}
    Capture Page Screenshot  botaoMTLogin.png

clicar no botao entrar
    Sleep    5s
    Wait Until Element Is Visible    ${BTN_ENTRAR_2}
    Click Element  ${BTN_ENTRAR_2}
    clicar no botão permitir


o sistema exibira o perfil logado
   clicar no botão permitir
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}


clicar no botão permitir
    ${passou}  Run Keyword And Return Status
    ...    Wait Until Element Is Visible  ${PERMITIR}
    Run Keyword If   ${passou}  Click Element    ${PERMITIR}


inserir o cpf ${cpf}
    Wait Until Page Contains Element  ${FIELD_CPF}
    Click Element  ${FIELD_CPF}
    Input Text  ${FIELD_CPF}  ${cpf}


inserir a senha ${senha}
    Click Element  ${FIELD_PASSWORD}
    Input Text  ${FIELD_PASSWORD}  ${senha}
    # Press Keycode    4

######Login com usuário válido em aparelho sem biometria
o usuário tenha cadastro válido e aparelho sem biometria
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}
o usuário efetua login
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}

o sistema exibirá a tela Home contendo todas as opções disponíveis
    Wait Until Element Is Visible    ${HOME_PAGE}
    Capture Page Screenshot    home.png
    
#####Clicar no botão "Veja mais"
o usuário tenha cadastro válido e efetue login
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}

o usuário clicar no botão "Veja mais" na Home
    Wait Until Element Is Visible    ${VEJA_MAIS}
    Click Element   ${VEJA_MAIS}

o sistema exibirá todos os botões cadastrados para o aplicativo
    Wait Until Element Is Visible    ${SERVICOS_DISPONIVEIS}
    Click Element    ${SERVICOS_DISPONIVEIS}    

o botão "Não encontrou o serviço digital do qual gostaria? Mande sua sugestão" estará visível
    Wait Until Element Is Visible    ${SUGESTAO}  
    Capture Page Screenshot    veja_mais.png 
    Press Keycode    4 

######Selecionar a opção para envio de sugestão de serviço digital
o usuário tenha efetuado login e clicado na opção "veja mais"
    o usuário clicar no botão "Veja mais" na Home

o usuário selecionar a opção "Não encontrou o serviço digital do qual gostaria? Mande sua sugestão"
    Wait Until Element Is Visible    ${SUGESTAO}
    Click Element    ${SUGESTAO}

o sistema direciona para navegador externo com formulário para preenchimento
    Wait Until Element Is Visible    ${FORMULARIO}
    Capture Page Screenshot    formulario.png
    Press Keycode    4
    Press Keycode    4

######Login de usuário válido com atributo de CNH
o usuário tenha cadastro válido e dado de CNH
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}

o usuário efetuar login e rolar a página para baixo
    Swipe    500    1500    500    500    1000

o sistema exibirá a tela com as informações da CNH do usuário
    Wait Until Element Is Visible    ${CNH_CARD}

#######Acessar CNH a partir do card de CNH disponível na Home

o usuário tenha cadastro válido com CNH e efetue login
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}

o usuário clicar no card de CNH disponível na Home
    Swipe    500    1500    500    500    1000
    Wait Until Element Is Visible    ${CNH_CARD}
    Click Element    ${CNH_CARD}

o sistema exibirá a tela com as informações detalhadas e demais opções da CNH do usuário
    Sleep    5s
    Wait Until Element Is Visible    ${INFO_CNH}
    Capture Page Screenshot    cnh_detalhes.png
    Press Keycode    4

######Login de usuário válido com carteirinha de celíaco emitida

o usuario esteja na Home do APP e possua carteira de celíaco emitida
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}
    
o usuário rolar a tela até a sessão Meus Documentos
    Swipe    500    1500    500    500    1000    
    Swipe By Percent    90    90    10    90    1000
    Swipe By Percent    90    90    10    90    1000

o sistema exibirá o card da carteirinha de celíaco emitida contendo as informações básicas
    Wait Until Element Is Visible    ${CARD_CELIACO}
    Capture Page Screenshot    carteirinha_celiaco.png

#######Acessar carteirinha de celíaco emitida a partir do card disponível na Home

o usuário clicar no card da carteirinha de celíaco emitida disponível na Home
    Swipe    500    1500    500    500    1000    
    Swipe By Percent    90    90    10    90    1000
    Swipe By Percent    90    90    10    90    1000
    Wait Until Element Is Visible    ${CARD_CELIACO}
    Click Element    ${CARD_CELIACO}

o sistema exibirá a tela com as informações detalhadas e demais opções da carteirinha de celíaco emitida
    Wait Until Element Is Visible    ${INFO_CELIACO}
    Capture Page Screenshot    carteirinha_celiaco_detalhes.png
    Press Keycode    4

######Acessar carteirinha de celíaco a partir do menu carteira

o usuário clicar no menu Carteira e selecionar a opção Carteira do Celíaco
    Wait Until Element Is Visible    ${CARTEIRA}
    Click Element    ${CARTEIRA}
    Wait Until Element Is Visible    ${BTN_CELIACO}
    Click Element    ${BTN_CELIACO}

#######Login com usuário válido com atributo de RG e sem documento emitido

o usuário tenha cadastro válido e dado de RG    
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}        

o usuário efetuar login e rolar a página para baixo e depois para a esquerda
    Swipe    500    1500    500    500    1000
    Swipe By Percent    90    90    10    90    1000

o sistema exibirá o card com as informações do RG do usuário
    Wait Until Element Is Visible    ${CARD_RG}
    Capture Page Screenshot    rg_detalhes.png

#######Visualizar Home quando usuário possui perfil servidor e carteirinha de servidor emitida

o usuário tenha cadastro válido e perfil servidor
    Wait Until Element Is Visible    ${PERFIL_CIDADAO}
o usuário efetua login e seleciona a opção Servidor dentro do Perfil no menu lateral direito
    VAR    ${MENU_INICIAL_NOME}    //android.widget.TextView[@text="${letra}"]   
    Wait Until Element Is Visible    ${MENU_INICIAL_NOME}
    Click Element    ${MENU_INICIAL_NOME}
    Wait Until Element Is Visible    ${BTN_SERVIDOR}
    Click Element    ${BTN_SERVIDOR}
o sistema apresenta tela home do perfil servidor com tema roxo
    Wait Until Element Is Visible   ${PERFIL_SERVIDOR}
    Capture Page Screenshot    home_servidor.png
    
na sessão Meus Documentos exibe o card da carteirinha de servidor, se tiver sido emitida
    Wait Until Element Is Visible    ${SERVIDOR_CARD}
    Sleep    5s
    Capture Page Screenshot    card_servidor.png

#######Acessar funcionalidade de carteira do servidor a partir do card da home

o usuário tenha cadastro válido com perfil servidor e carteirinha de servidor emitida
    VAR    ${MENU_INICIAL_NOME}    //android.widget.TextView[@text="${letra}"]   
    Wait Until Element Is Visible    ${MENU_INICIAL_NOME}
    Click Element    ${MENU_INICIAL_NOME}
    Wait Until Element Is Visible    ${BTN_SERVIDOR}
    Click Element    ${BTN_SERVIDOR}
o usuário clicar no card da carteirinha de servidor emitida disponível na Home
    Wait Until Element Is Visible    ${SERVIDOR_CARD}
    Click Element    ${SERVIDOR_CARD}

o sistema exibirá a tela com as informações detalhadas e demais opções da carteirinha de servidor emitida
    Wait Until Element Is Visible    ${CARTEIRA_SERVIDOR}
    Capture Page Screenshot    carteirinha_servidor_detalhes.png
    Press Keycode    4