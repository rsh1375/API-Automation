***Settings***
Library  JSONLibrary
Library  REST

***Test Cases***
Get Information
    Set Headers  {"Content-Type":"application/json"}
    ${RESPONSE}=  GET  https://gorest.co.in/public/v1/posts/123/comments
    ${RES}=  Output  response body

    #VALIDATIONS
    ${DATA}=  get value from json  ${RESPONSE}  $.data 
    Should Be Empty  ${DATA}
    ${PAGE}=  get value from json  ${RES}  $.meta.pagination.page 
    log to console  ${PAGE}
    Should Be Equal As Strings  ${PAGE[0]}  1