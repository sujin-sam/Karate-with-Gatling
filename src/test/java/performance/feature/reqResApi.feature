Feature: GET Api

    Background:
        * url 'https://reqres.in/'

    Scenario: GET method should return 200
        Given path '/api/users/2'
        And header karate-name = 'GET-users'
        When method GET
        Then status 200

    * def c_userName = response.data.first_name