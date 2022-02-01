***Settings***
Library  REST
Library  JSONLibrary

***Test Cases***
Post Information
    ${RESULT}=  Load Json From File  ${CURDIR}/2.json
    Set Headers  {"Accept":"application/json"}
    Set Headers  {"Content-Type":"application/json"}
    ${RESPONSE}=  POST  https://reqres.in/api/users  ${RESULT}
    ${RES}=  Output  response body

    #VALIDATION
    ${NAME}=  get value from json  ${RES}   $.name
    Should Be Equal  ${NAME[0]}  morpheus
    ${JOB}=  get value from json  ${RES}   $.job
    Should Be Equal  ${JOB[0]}  leader
    