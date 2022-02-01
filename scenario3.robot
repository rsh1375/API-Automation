***Settings***
Library  REST
Library  JSONLibrary

***Test Cases***
Post Information
    ${RESULT}=  Load Json From File  ${CURDIR}/3.json
    Set Headers  {"Accept":"application/json"}
    Set Headers  {"Content-Type":"application/json"}
    ${RESPONSE}=  POST  https://reqres.in/api/register  ${RESULT}
    ${RES}  Output  response

    #VALIDATIONS
    ${STATUS_CODE}=  get value from json  ${RESPONSE}  $.status
    Should Be Equal As Strings  ${STATUS_CODE[0]}  400