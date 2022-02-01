***Settings***
Library  REST
Library  JSONLibrary

***Test Cases***
Post Information
    ${RESULT}=  Load Json From File  ${CURDIR}/4.json
    ${NEW_RESULT}=  Load Json From File  ${CURDIR}/new_4.json
    Set Headers  {"Accept":"application/json"}
    Set Headers  {"Content-Type":"application/json"}
    POST  https://reqres.in/api/users  ${RESULT}
    POST  https://reqres.in/api/users  ${NEW_RESULT}
    ${RESPONSE}=  Output  response body

    #VALIDATION
    ${NAME}=  get value from json  ${RESPONSE}   $.name
    Should Be Equal  ${NAME[0]}  david
    ${EMAIL}=  get value from json  ${RESPONSE}   $.email
    Should Be Equal  ${EMAIL[0]}  david@gmail.com
    ${ID}=  get value from json  ${RESPONSE}   $.id
    ${ID_STR}  Convert To String  ${ID[0]}
    ${LENGTH}=  Get Length  ${ID_STR}
    Should Be Equal As Integers  ${LENGTH}	3
   
