*** Settings ***
Resource  ../common/main.resource


*** Variables ***
${PERFIL_CIDADO}  //android.widget.TextView[@text="Perfil Cidadão"]
${MENU_CARTEIRA}  //android.widget.TextView[@resource-id="br.gov.mt.cepromat.mtcidadao:id/bottom_navigation_item_title" and @text="Carteira"]
${NAO_HÁ_DOCUMENTOS}   //android.widget.TextView[@text="Não há documentos salvos."]
${LISTA_CARDS}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
${LISTAR_CRLV}  //android.widget.TextView[@text="Certificado de Registro e Licenciamento de Veículo"]
${COMPARTILHAR_CRLV}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup
#${COMPARTILHAR_DADOS}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup
${BANDEJA_COMPARTILHAMENTO}  //android.widget.RelativeLayout[@resource-id="android:id/chooser_header"]
${ATUALIZAR_CARD}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup
${MENSAGEM_ATUALIZAR_CARD}  //android.widget.Button[@resource-id="android:id/button1"]
${BTN_OK_COMPARTILHAR}  //android.widget.Button[@resource-id="android:id/button1"]
${VISUALIZAR_CRLV}  //android.widget.TextView[@text="Certificado de Registro e Licenciamento de Veículo"]
${MODAL_EXCLUIR_CRLV}  //android.widget.TextView[@resource-id="android:id/alertTitle"]
${COMPARTILHAR_AUTISTMO}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup
${CARD_RG}  //android.widget.TextView[@text="Registro de Identificação Civil (RG)"]
${COMPARTILHAR_RG}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${ATUALIZAR_RG}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${BTN_RG}  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup
${IMAGEM_RG}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${IMAGEM_RG_2}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${QRCODE_RG}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[@bounds='[150,1052][930,1643]']
${PERFIL}    //android.widget.TextView[@text="Perfil Cidadão"]
${CARTEIRINHA_SAUDE}    //android.widget.TextView[@text="Carteira MT-Saúde"]
${BTN_COMPARTILHAR}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
${BTN_ATUALIZAR}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
${BTN_EXCLUIR}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
${SHARING}    //android.widget.TextView[@resource-id="com.android.intentresolver:id/headline"]
${MENSAGEM_ATUALIZAR_CARD}  //android.widget.TextView[@resource-id="android:id/message"]
${BTN_CANCELAR}  //android.widget.Button[@resource-id="android:id/button2"]
${BTN_CARTEIRINHA}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup
${IMAGEM_CARTEIRINHA}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView                   

*** Keywords ***
o usuário clica na opção Carteira do Menu Inferior
    Wait Until Element Is Visible    ${MENU_CARTEIRA}
    Click Element    ${MENU_CARTEIRA}
    Capture Page Screenshot  menucarteira.png

o sistema apresenta tela carteira com imagem e informação de que não há documentos salvos
    Wait Until Element Is Visible    ${NAO_HÁ_DOCUMENTOS}
    Capture Page Screenshot  sem_documentos.png

###### emitiu um ou mais documentos #####

o sistema apresenta tela carteira contendo mensagem sobre carteira offline e lista de cards dos documentos emitidos pelo usuário
    Wait Until Element Is Visible  ${LISTA_CARDS}
    Capture Page Screenshot  lista_cards1.png

#### visualizar carteira CRLV ####
o sistema apresenta a tela de Carteira contendo card do CRLV contendo dados do Carro
    Wait Until Element Is Visible    ${LISTAR_CRLV}
    Capture Page Screenshot  lista_cards2.png

######### Compartinhar CRLV a partir da tela Documentos #####
o usuário tenha visualizado card do CRLV na tela Carteira
    Sleep    5s
    o usuário clica na opção Carteira do Menu Inferior

o usuário clica no ícone Compartilhar do card    
    Wait Until Element Is Visible    ${COMPARTILHAR_CRLV}
    Click Element    ${COMPARTILHAR_CRLV}
    Capture Page Screenshot  compartilhar_crlv.png

o sistema apresenta bandeja de compartilhamento CRLV
    Wait Until Element Is Visible    ${BANDEJA_COMPARTILHAMENTO}
    Capture Page Screenshot   bandeija.png
    Press Keycode    4
    Press Keycode    4

  
##### Atualizar CRLV a partir da tela Documentos #####
o usuário tenha visualizado card do CRLV na tela menu Carteira
    Sleep    5s
    o usuário clica na opção Carteira do Menu Inferior
    Wait Until Element Is Visible    ${LISTA_CARDS}

o usuário clica no ícone Atualizar do card
    Wait Until Element Is Visible    ${ATUALIZAR_CARD}
    Click Element    ${ATUALIZAR_CARD}
    Capture Page Screenshot  atualizar.png

o sistema exibe um modal de atualizar o card
    Wait Until Element Is Visible    ${MENSAGEM_ATUALIZAR_CARD}
    Click Element    //android.widget.Button[@resource-id="android:id/button2"]
    Capture Page Screenshot  modal_atualizar.png
    
    
################ EXCLUIR CARD CRLV  ##############
o usuário tenha visualizado card do CRLV no menu carteira
    Sleep    5s
    o usuário clica na opção Carteira do Menu Inferior
    Wait Until Element Is Visible    ${VISUALIZAR_CRLV}
    
 o usuário clica no icone excluir card
    Sleep    5s
    Wait Until Element Is Visible    ${VISUALIZAR_CRLV}   
    Click Element    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[4]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    #//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[4]/android.view.ViewGroup
    Capture Page Screenshot  excluir_crlv.png

sistema exibe a modal de exclusão
    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="android:id/alertTitle"]
    Click Element   //android.widget.Button[@resource-id="android:id/button2"]
    #//android.widget.Button[@resource-id="android:id/button1"]
    Capture Page Screenshot  modal_excluir.png


################ VISUALIZAR CARTEIRA AUTISTA  ##############
o usuário tenha acessado o menu carteira
    o usuário clica na opção Carteira do Menu Inferior   

o sistema exibe a carteira de Autismo
    Wait Until Element Is Visible   //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView     

###### Compartinhar Carteirinha do Autista 
o usuário tenha visualizado a Carteira de Autista
    o usuário clica na opção Carteira do Menu Inferior 

o usuário clica no ícone Compartilhar Carteira de Autismo
    Wait Until Element Is Visible    ${COMPARTILHAR_AUTISTMO} 
    Click Element    ${COMPARTILHAR_AUTISTMO}

o sistema apresenta bandeja de compartilhamento da Carteira de Autista 
    Wait Until Element Is Visible    //android.widget.RelativeLayout[@resource-id="android:id/chooser_header"]     
    Capture Page Screenshot  compatilhar_carteria_autista.png

###### ATUALIZAR Carteirinha do Autista 
o usuário tenha visualizado uma Carteira de Autista
    o usuário clica na opção Carteira do Menu Inferior

o usuário clica no ícone atualizar Carteira de Autismo
    Wait Until Element Is Visible    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup
    Click Element    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup

o sistema apresenta modal de Atualização do Card
    Wait Until Element Is Visible    //android.widget.ScrollView[@resource-id="android:id/buttonPanel"]/android.widget.LinearLayout
    Click Element    //android.widget.Button[@resource-id="android:id/button2"]
    Capture Page Screenshot  atualizar_autista.png

###### Abrir Carteirinha do Autista na tela Documentos
o usuário tenha visualizado Carteira de Autista na tela documentos
    o usuário clica na opção Carteira do Menu Inferior

o usuário clica no ícone abrir Carteira de Autismo
    Wait Until Element Is Visible    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup
    Click Element    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup

o sistema exibe a carteirinha de autista
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
    Capture Page Screenshot  carteirinha.png

###### Compartinlhar RG a partir da tela Documentos
o usuário tenha visualizado Carteira RG
    o usuário clica na opção Carteira do Menu Inferior

o usuário clica no ícone compartihar rg
    Wait Until Element Is Visible    ${CARD_RG}
    Click Element    ${COMPARTILHAR_RG}
    Capture Page Screenshot  icone_compartilhar_rg.png

o sistema apresenta bandeja de compartilhamento RG
    Wait Until Element Is Visible    ${BANDEJA_COMPARTILHAMENTO}
    Capture Page Screenshot  bandeja_rg.png
    Press Keycode    4
    Press Keycode    4

############ Atualizar RG a partir da tela Documentos    
o usuário tenha visualizado RG na Tela Documentos
    o usuário clica na opção Carteira do Menu Inferior

o usuário clica no ícone atualizar rg
    Wait Until Element Is Visible    ${ATUALIZAR_RG}
    Click Element    ${ATUALIZAR_RG}
    Capture Page Screenshot  atualizar_rg_icone.png

o sistema exibe modal de Atualização da RG
    Wait Until Element Is Visible    ${BANDEJA_COMPARTILHAMENTO}    
    Capture Page Screenshot  bandeja_rg.png
    Press Keycode    4
    Press Keycode    4
    
o usuário clica no ícone abrir do respectivo documento
    Sleep    10s
    Wait Until Element Is Visible    ${BTN_RG}
    Click Element    ${BTN_RG}

o sistema exibe a carteira de RG
    Wait Until Element Is Visible    ${IMAGEM_RG}
    Capture Page Screenshot  rg_imagem.png


desliza para a segunda página do carrossel
    Swipe    1000    800    -800    0

o sistema exibe a segunda página do RG
    Sleep    5s
    Wait Until Element Is Visible    ${IMAGEM_RG_2}
    Capture Page Screenshot  rg_pagina2.png

desliza para a terceira página do carrossel
    Swipe    1000    800    -800    0
    Swipe    1000    800    -800    0

o sistema exibe o QRCode do RG
    Sleep    5s
    Wait Until Element Is Visible    ${QRCODE_RG}
    Capture Page Screenshot  rg_qrcode.png

o usuário possui carteirinha do MT Saúde
    Wait Until Element Is Visible    ${PERFIL}

o usuário acessa o menu carteira
    o usuário clica na opção Carteira do Menu Inferior

o sistema exibe a carteirinha do MT Saúde com nome completo
    Wait Until Element Is Visible    ${CARTEIRINHA_SAUDE}
    Capture Page Screenshot  carteira_mt_saude.png
   
são exibidos os ícones de compartilhar, atualizar e excluir
    Wait Until Element Is Visible    ${BTN_COMPARTILHAR}
    Wait Until Element Is Visible    ${BTN_ATUALIZAR}
    Wait Until Element Is Visible    ${BTN_EXCLUIR}

o usuário tenha visualizado a Carteirinha do MT Saúde
    o usuário clica na opção Carteira do Menu Inferior
    Wait Until Element Is Visible    ${CARTEIRINHA_SAUDE}

o usuário clica no ícone Compartilhar da Carteirinha do MT Saúde
    Wait Until Element Is Visible    ${BTN_COMPARTILHAR}
    Click Element    ${BTN_COMPARTILHAR}

o sistema apresenta bandeja de compartilhamento da Carteirinha do MT Saúde  
    Wait Until Element Is Visible    ${SHARING}    
    Capture Page Screenshot  compartilhar_mt_saude.png
    Press Keycode    4
    Press Keycode    4

o usuário clica no ícone atualizar da Carteirinha do MT Saúde 
    Wait Until Element Is Visible    ${BTN_ATUALIZAR}
    Click Element    ${BTN_ATUALIZAR}

o sistema apresenta modal de Atualização do Card da carteirinha
    Wait Until Element Is Visible    ${MENSAGEM_ATUALIZAR_CARD}
    Capture Page Screenshot  atualizar_mt_saude.png
    # Click Element    ${BTN_CANCELAR}

o usuário tenha visualizado card da Carteirinha do MT Saúde na tela documentos
    o usuário clica na opção Carteira do Menu Inferior
    Wait Until Element Is Visible    ${CARTEIRINHA_SAUDE}

o usuário clica no ícone abrir da carteirinha de saúde
    Wait Until Element Is Visible    ${BTN_CARTEIRINHA}
    Click Element    ${BTN_CARTEIRINHA}

o sistema exibe a carteirinha de saúde do usuário
    Wait Until Element Is Visible    ${IMAGEM_CARTEIRINHA}
    Capture Page Screenshot  carteirinha_saude.png

