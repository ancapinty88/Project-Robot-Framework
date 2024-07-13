***Settings***
Library    SeleniumLibrary
***Variables***
${url}              http://google.com
${titleExpected}    Google
***Test Cases***
Open google and check title
    Going to url
    Title should be    ${titleExpected}
    Close browser
***Keywords***
Going to url
    Open Browser               ${url}    edge
    Maximize browser window