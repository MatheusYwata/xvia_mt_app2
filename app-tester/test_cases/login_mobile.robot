*** Settings ***
Resource    ../common/main.resource
Test Setup    Abrir app
Test Teardown   fechar app



*** Test Cases ***

Cenario 1 : logar no APP mt.gov.br com dados usuario
    [Tags]  usuario
    VAR  ${letra}    ${USUARIO.NAME}[0:1]    scope=TEST
    Dado que o usuario esteja na Home do APP
    Quando o usuario clicar no botao entrarCom
    E inserir o cpf ${USUARIO.CPF}
    E inserir a senha ${USUARIO.PASSWORD}
    E clicar no botao entrar
    Então o sistema exibira o perfil logado


# Cenario 2 : logar no APP mt.gov.br com dados de servidor
#     [Tags]  servidor
#     VAR  ${letra}    ${SERVIDOR.LETRA}    scope=TEST
#     Dado que o usuario esteja na Home do APP
#     Quando o usuario clicar no botao entrarCom
#     E inserir o cpf ${SERVIDOR.CPF}
#     E inserir a senha ${SERVIDOR.PASSWORD}
#     E clicar no botao entrar
#     #Então o sistema exibira o perfil do usuario logado

Cenário 3: Login com usuário válido em aparelho sem biometria
    [Tags]  login_home
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuário tenha cadastro válido e aparelho sem biometria
    Quando o usuário efetua login
    Então o sistema exibirá a tela Home contendo todas as opções disponíveis

Cenário 4: Clicar no botão "Veja mais"
    [Tags]  veja_mais
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuário tenha cadastro válido e efetue login
    Quando o usuário clicar no botão "Veja mais" na Home
    Então o sistema exibirá todos os botões cadastrados para o aplicativo
    E o botão "Não encontrou o serviço digital do qual gostaria? Mande sua sugestão" estará visível

Cenário 5: Selecionar a opção para envio de sugestão de serviço digital
    [Tags]  sugestao_servico
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuário tenha efetuado login e clicado na opção "veja mais"
    Quando o usuário selecionar a opção "Não encontrou o serviço digital do qual gostaria? Mande sua sugestão"
    Então o sistema direciona para navegador externo com formulário para preenchimento

Cenário 6: Login de usuário válido com atributo de CNH
    [Tags]  login_cnh
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuário tenha cadastro válido e dado de CNH
    Quando o usuário efetuar login e rolar a página para baixo
    Então o sistema exibirá a tela com as informações da CNH do usuário

Cenário 7: Acessar CNH a partir do card de CNH disponível na Home
    [Tags]  card_cnh
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuário tenha cadastro válido com CNH e efetue login
    Quando o usuário clicar no card de CNH disponível na Home
    Então o sistema exibirá a tela com as informações detalhadas e demais opções da CNH do usuário

Cenário 8: Login de usuário válido com carteirinha de celíaco emitida
    [Tags]  carteirinha_celiaco
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuario esteja na Home do APP e possua carteira de celíaco emitida
    Quando o usuário rolar a tela até a sessão Meus Documentos
    Então o sistema exibirá o card da carteirinha de celíaco emitida contendo as informações básicas

Cenário 9: Acessar carteirinha de celíaco emitida a partir do card disponível na Home
    [Tags]  acessar_cart_celiaco
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuario esteja na Home do APP e possua carteira de celíaco emitida
    Quando o usuário clicar no card da carteirinha de celíaco emitida disponível na Home
    Então o sistema exibirá a tela com as informações detalhadas e demais opções da carteirinha de celíaco emitida

Cenário 10: Acessar carteirinha de celíaco a partir do menu carteira
    [Tags]  acessar_cart_celiaco_menu
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuario esteja na Home do APP e possua carteira de celíaco emitida
    Quando o usuário clicar no menu Carteira e selecionar a opção Carteira do Celíaco
    Então o sistema exibirá a tela com as informações detalhadas e demais opções da carteirinha de celíaco emitida

Cenário 11: Login com usuário válido com atributo de RG e sem documento emitido
    [Tags]  login_rg
    [Setup]  Setup Com Login    usuario_login=&{USUARIO}
    Dado que o usuário tenha cadastro válido e dado de RG
    Quando o usuário efetuar login e rolar a página para baixo e depois para a esquerda
    Então o sistema exibirá o card com as informações do RG do usuário

Cenário 12: Visualizar Home quando usuário possui perfil servidor e carteirinha de servidor emitida
    [Tags]  perfil_servidor_carteira
    [Setup]  Setup Com Login    usuario_login=&{SERVIDOR}
    Dado que o usuário tenha cadastro válido e perfil servidor
    Quando o usuário efetua login e seleciona a opção Servidor dentro do Perfil no menu lateral direito
    Então o sistema apresenta tela home do perfil servidor com tema roxo
    E na sessão Meus Documentos exibe o card da carteirinha de servidor, se tiver sido emitida
    #não possui carteirinha de servidor emitida

Cenário 13: Acessar funcionalidade de carteira do servidor a partir do card da home
    [Tags]  carteira_servidor
    [Setup]  Setup Com Login    usuario_login=&{SERVIDOR}
    Dado que o usuário tenha cadastro válido com perfil servidor e carteirinha de servidor emitida
    Quando o usuário clicar no card da carteirinha de servidor emitida disponível na Home
    Então o sistema exibirá a tela com as informações detalhadas e demais opções da carteirinha de servidor emitida