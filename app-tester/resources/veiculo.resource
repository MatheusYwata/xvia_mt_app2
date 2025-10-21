*** Settings ***
Resource  ../common/main.resource

*** Variables ***
${VEICULO}  //android.view.ViewGroup[@content-desc="Veículo"]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
#//android.view.ViewGroup[@content-desc="Veículo"]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
${MARCA_VEICULO}  //android.view.View[@resource-id="root"]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]
#//android.view.View[@resource-id="root"]/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]
${LICENCIAMENTO_ANUAL}  //android.widget.TextView[@text="Licenciamento Anual até o vencimento 2024"]
#${LICENCIAMENTO_ANO_ANTERIOR}  //android.widget.ListView/android.view.View[2]/android.view.View/android.view.View
${VERIFICAR_DEBITO}  //android.view.View[@resource-id="root"]/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View[1]
${SOLICITAR_CRLV}   ///android.view.View[@resource-id="veiculo-solicitar-documento"]
# xpath=//android.widget.Button[@text='veiculo-solicitar-documento']
${PERFIL}  //android.widget.TextView[@text="Perfil Cidadão"]
${CONFIRMACAO_CRLV}  //android.view.View[@resource-id="root"]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View
${PRIMEIRO_EMPLACAMENTO}  //android.widget.TextView[@text="Primeiro emplacamento"]
${CAMPO_EMAIL}  //android.widget.EditText[@resource-id="emplacamento_email"]
${BTN_ENDERECO}  //android.widget.Button[@text="Cadastrar endereço"]
${CAMPO_CHASSI}    //android.widget.EditText[@resource-id="emplacamento_chassi"]
${CAMPO_NF}    //android.widget.EditText[@resource-id="emplacamento_notaFiscal"]
${DATA_NF}    //android.widget.EditText[@resource-id="emplacamento_dataNota"]
${VALOR_NF}    //android.widget.EditText[@resource-id="emplacamento_valorNota"]
${BTN_ENVIAR_SOLICITACAO}  
*** Keywords ***

#######Consulta Licenciamento Atual do veículo

vejo o painel do cidadão logado
    Wait Until Element Is Visible    ${PERFIL} 

o usuario clica na opção VEÍCULO
    Wait Until Element Is Visible    ${VEICULO}
    Click Element    ${VEICULO}
    Sleep    10s

clicar na marca do veiculo
    Sleep    5s
    Wait Until Element Is Visible   ${MARCA_VEICULO}
    Click Element    ${MARCA_VEICULO}

clicar licenciamento anual do ano corrente
    Sleep    5s
    Swipe    500    500    500    1500    5000
    Wait Until Element Is Visible   ${LICENCIAMENTO_ANUAL}
    Click Element    ${LICENCIAMENTO_ANUAL}

o sitema exibira a modal com os debitos
    Wait Until Element Is Visible   ${VERIFICAR_DEBITO}  timeout=10s

################# SOLICITAR CRLV 

clicar no solicitar CRLV
    Sleep    5s
    Swipe    500    500    500    1500    5000
    Swipe    500    500    500    1500    5000
    Wait Until Element Is Visible   ${SOLICITAR_CRLV}
    Click Element    ${SOLICITAR_CRLV}

o sistema exibira a modal da confirmação do CRLV solicitado e adicionado a carteira
    Wait Until Element Is Visible   ${CONFIRMACAO_CRLV} 
    Press Keycode    4

################# SOLICITAR PRIMEIRO EMPLACAMENTO

E clicar na opção primeiro emplacamento
    Sleep    5s
    Swipe    500    500    500    1500    5000
    Wait Until Element Is Visible   ${PRIMEIRO_EMPLACAMENTO}
    Click Element    ${PRIMEIRO_EMPLACAMENTO}

preencher os dados solicitados para o primeiro emplacamento
    Wait Until Element Is Visible   ${CAMPO_EMAIL}
    Input Text    ${CAMPO_EMAIL}    teste@email.
    Wait Until Element Is Visible    ${BTN_ENDERECO}
    Click Element    ${BTN_ENDERECO}
    


o sistema permitirá enviar a solicitação de primeiro emplacamento