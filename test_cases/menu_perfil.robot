*** Settings ***
Resource    ../common/main.resource
Test Teardown   fechar app


*** Test Cases ***
Cenario 1 : Exibição do menu lateral quando usuário possui apenas perfil cidadão
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  menu_perfil_cidadao
    Dado que usuário tenha cadastro válido e apenas perfil cidadão
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    Então o sistema apresenta o menu lateral completo e contendo apenas perfil de cidadão

Cenário 2: Exibição do menu lateral quando usuário possui perfil servidor
    [Setup]    Setup Com Login    usuario_login=&{SERVIDOR}
    [Tags]  menu_perfil_servidor
    Dado que usuário tenha cadastro válido e perfil servidor
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    Então o sistema apresenta o menu lateral completo e contendo perfil de servidor

Cenário 3: Clicar na opção cidadao no menu lateral direito
    [Setup]    Setup Com Login    usuario_login=&{SERVIDOR}
    [Tags]  perfil_cidadao
    Dado que usuário tenha cadastro válido e perfil servidor
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção cidadao
    Então o sistema direciona para a home do tema cidadão contendo respectivos serviços e documentos
        
Cenário 4: Clicar na opção servidor no menu lateral direito
    [Setup]    Setup Com Login    usuario_login=&{SERVIDOR}
    [Tags]  perfil_servidor
    Dado que usuário tenha cadastro válido e perfil servidor
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção servidor
    Então o sistema direciona para home do tema servidor contendo respectivos serviços e documentos

Cenário 5: Clicar na opção Sair do menu lateral direito
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  menu_lateral_sair
    Dado que o usuário tenha cadastro válido
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    Então o sistema apresenta a opção Sair no menu lateral direito

Cenário 6: Clicar no menu Preferências do menu lateral direito
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  menu_lateral_preferencias
    Dado que o usuário tenha cadastro válido
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção Preferências
    Então o sistema apresenta a tela de Preferências do aplicativo

Cenário 7: Clicar na opção Certificado MT.id quando usuário não possui MT.id no aparelho
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  mtid_desabilitado
    Dado que o usuário tenha cadastro válido
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção Preferências
    E o usuário clica na opção Certificado MT.id
    Então botão deve estar desabilitado e o sistema não permite a ação

Cenário 8: Clicar na opção Certificado MT.id quando usuário possui MT.id ativo no aparelho
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  mtid_habilitado
    Dado que o usuário tenha cadastro válido
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção Preferências
    E o usuário clica na opção Certificado MT.id
    Então o sistema apresenta a tela com informações sobre MT.id
    E apresenta a opção para cancelar o certificado no aparelho
    #não está ativo nessa massa de teste

Cenário 9: Clicar na opção Cadastro MT.Login na tela Preferências do menu lateral direito
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  mt_login
    Dado que o usuário tenha cadastro válido
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção Preferências
    E o usuário clica na opção Cadastro MT.Login
    Então o sistema direciona para a tela de dados do MT.Login no navegador externo
    
Cenário 10: Clicar na opção política de privacidade na tela Preferências do menu lateral direito
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  politica_privacidade
    Dado que o usuário tenha cadastro válido
    Quando o usuário efetua login e clica no ícone com a inicial do nome
    E o usuário clica na opção Preferências
    E o usuário clica na opção Política de Privacidade
    Então o sistema direciona para a tela de política de privacidade no navegador externo

Cenário 11: Clicar na opção Serviços do menu inferior
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  menu_inferior_servicos
    Dado que o usuário tenha cadastro válido e esteja logado no aplicativo
    Quando o usuário clica na opção Serviços do menu inferior
    Então o sistema direciona para a tela de serviços para busca livre
    E mostra lista de órgãos e categorias para seleção

Cenário 12: Clicar na opção Dúvidas do menu inferior
    [Setup]    Setup Com Login    usuario_login=&{USUARIO}
    [Tags]  menu_duvidas
    Dado que o aplicativo esteja aberto na tela de login
    Quando o usuário clica na opção Dúvidas no menu inferior
    Então o sistema direciona para a tela de dúvidas