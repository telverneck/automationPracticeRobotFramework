***Settings
Documentation       API Request

Resource            ../Resources/baseAPI.robot
Suite Setup         API connection




***Test Cases
Scenario1: Request all books
    Request all books



***Keywords

Request all books
    ${response}         GET Request          ${ALIAS}        /api/v1/Books
    Log                 ${response.text}