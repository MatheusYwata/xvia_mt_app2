*** Settings ***
Resource    ../common/main.resource
Test Setup    Abrir app
# Test Teardown   fechar app



*** Test Cases **

Cenário 1: Carregamento da lista de órgãos não logado
    [Tags]    lista_orgaos
    Dado que o usuário tenha instalado o aplicativo
    Quando clicar em Veja todos os órgãos ou seleciona a opção órgãos
    Então o sistema apresenta a lista de órgãos

Cenário 2: Carregamento da lista de categorias não logado
    [Tags]    lista_categorias
    Dado que o usuário tenha instalado o aplicativo
    Quando clicar em Veja todos os órgãos e seleciona a opção categorias
    Então o sistema apresenta a lista de categorias

Cenário 3: Pesquisa livre não logado com termo da carta de serviços 
    [Tags]    pesquisa_carta_servicos
    Dado que o usuário tenha instalado o aplicativo
    E clicar em Veja todos os órgãos
    Quando o usuário digita um termo da carta de serviços
    Então o sistema apresenta retorno conforme busca do catalogo portal de serviços

Cenário 4: Pesquisa livre não logado com termo de órgão
    [Tags]    pesquisa_orgaos
    Dado que o usuário tenha instalado o aplicativo
    E clicar em Veja todos os órgãos
    Quando o usuário digita um termo de órgão
    Então o sistema apresenta retorno conforme busca do catalogo de orgaos

Cenário 5: Pesquisa livre não logado com termo de categoria
    [Tags]    pesquisa_categorias
    Dado que o usuário tenha instalado o aplicativo
    E clicar em Veja todos os órgãos e seleciona a opção categorias
    Quando o usuário digita um termo de categoria
    Então o sistema apresenta retorno conforme busca do catalogo de categorias

Cenário 6: Pesquisa livre não logado com termo de serviço/botão
    [Tags]    pesquisa_botao
    Dado que o usuário tenha instalado o aplicativo
    E clicar em Veja todos os órgãos
    Quando o usuário digita um termo referente a botão cadastrado no app
    Então o sistema retorna o botão corretamente

Cenário 7: Clicar no botão após pesquisa quando usuário não logado
    [Tags]    clicar_botao
    Dado que o usuário tenha tenha efetuado pesquisa com retorno de botão
    Quando o usuário clicar no botão
    Então a aplicação exibe mensagem informando que usuário será direcionado para a tela de login
    E mostra botão Voltar para o início
    
Cenário 8: Voltar para tela inicial do app após pesquisa de botão quando usuário não logado
    [Tags]    voltar_inicio
    Dado que o usuário tenha tenha efetuado pesquisa com retorno de botão
    E o usuário clicar no botão
    Quando o usuário clicar em Voltar para o início
    Então a aplicação retorna para tela inicial do app

Cenário 9: Clicar em acessar serviço após pesquisa quando usuário não logado
    [Tags]    acessar_servico
    Dado que o usuário tenha tenha efetuado pesquisa com retorno de serviço
    Quando o usuário clicar em Acessar o serviço digital
    Então a aplicação exibe mensagem informando que usuário será direcionado para a tela de login
    E mostra botão Voltar para o início

# Cenário 10: Voltar para tela inicial do app após pesquisa de botão quando usuário não logado
#     [Tags]    voltar_inicio_servico
#     Dado que o usuário tenha efetuado pesquisa com retorno de serviço que possua botão "Acessar Serviço Digital" e clique nele
#     E sistema tenha apresentado mensagem com botão "Voltar para o Início"
#     Quando o usuário clica no botão "Voltar para o Início"
#     Então a aplicação retorna para a tela inicial do app

Cenário 11: 