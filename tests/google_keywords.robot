*** Settings  ***
Documentation  Google検索のサンプル.
#ライブラリのインポート
Library        OperatingSystem
Library        SeleniumLibrary

*** Variables ***
#変数定義、robotコマンドで-v or --variableで変更可能
${BASE_URL}       https://www.google.com
${BROWSER}        Chrome

*** Test Cases ***
#英語の感じで書く(キーワードと区分するため、空白２つ以上必要)))
GoogleでRPAトレンドを検索するテスト
    #環境変数にhttp://chromedriver.chromium.org/downloadsのドライバーを設定
	Open Browser  ${BASE_URL}  ${BROWSER} 
	Input Text  name=q  RPAトレンド
    Press Keys  name=q  RETURN
    ${links} =  Get Webelements  css=h3 > div
    :For  ${link}  IN  @{links}
        \  ${text} =  Get Text  ${link}
        \  Log To Console  ${text}
    Length Should Be  ${links}  10
    Close Browser

#日本語の感じで書く
Googleでテスト自動化を検索するテスト
    ChromeでGoogleを開く
    テスト自動化を検索する
    検索結果を取得して出力する
    ブラウザを閉じる

*** Keywords ***
#いわゆる関数を宣言。特にTestCases内に使うものを定義
ChromeでGoogleを開く
    Open Browser  ${BASE_URL}  ${BROWSER} 
    
テスト自動化を検索する
	Input Text  name=q  テスト自動化
	Press Keys  name=q  RETURN

検索結果を取得して出力する
	${links} =  Get Webelements  css=h3 > div
    :For  ${link}  IN  @{links}
        \  ${text} =  Get Text  ${link}
        \  Log To Console  ${text}
    Length Should Be  ${links}  11

ブラウザを閉じる
    Close Browser