*** Settings ***
Library           OperatingSystem
Library           Process
Library           ${CURDIR}/firebase_utils.py    WITH NAME    FirebaseLib

*** Variables ***
${FIREBASE_CREDENTIALS_PATH}    ${CURDIR}/../config/gcloud-service-account.json
${FIREBASE_APK_PATH}            releases/latest
${LOCAL_APK_PATH}               ${CURDIR}/../apps/app.apk

*** Keywords ***
Download Latest APK From Firebase
    [Documentation]    Downloads the latest APK from Firebase Storage
    ${result}=    FirebaseLib.Download Latest Apk    ${FIREBASE_APK_PATH}    ${LOCAL_APK_PATH}
    Should Be True    ${result}    Failed to download latest APK from Firebase

Download Specific APK From Firebase
    [Arguments]    ${firebase_file_path}
    [Documentation]    Downloads a specific APK from Firebase Storage
    ${result}=    FirebaseLib.Download Apk    ${firebase_file_path}    ${LOCAL_APK_PATH}
    Should Be True    ${result}    Failed to download APK from Firebase: ${firebase_file_path}

Set Firebase Credentials From Environment
    [Documentation]    Set Firebase credentials from environment variables
    ${creds_exist}=    Run Keyword And Return Status    File Should Exist    ${FIREBASE_CREDENTIALS_PATH}
    
    # If credentials file doesn't exist, check for environment variables
    Run Keyword If    not ${creds_exist}    Log    Using environment variables for Firebase authentication