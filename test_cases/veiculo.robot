*** Settings ***
Resource    ../common/main.resource
Test Setup    Setup Com Login    usuario_login=&{USUARIO}
Test Teardown   fechar app



*** Test Cases ***

Cenario 1 : Consulta Licenciamento Atual do veículo
    [Tags]  licenciamento_atual
    Dado que vejo o painel do cidadão logado
    Quando o usuario clica na opção VEÍCULO
    E clicar na marca do veiculo
    E clicar licenciamento anual do ano corrente
    Então o sitema exibira a modal com os debitos

Cenario 2: Solicitar CRLV
    [Tags]  solicitar_CRLV
    Dado que vejo o painel do cidadão logado
    Quando o usuario clica na opção VEÍCULO
    E clicar na marca do veiculo
    E clicar no solicitar CRLV  
    Então o sistema exibira a modal da confirmação do CRLV solicitado e adicionado a carteira

Cenário 3: Solicitar primeiro emplacamento
    [Tags]  primeiro_emplacamento
    Dado que vejo o painel do cidadão logado
    Quando o usuario clica na opção VEÍCULO
    E clicar na opção primeiro emplacamento
    E preencher os dados solicitados para o primeiro emplacamento
Então o sistema permitirá enviar a solicitação de primeiro emplacamento