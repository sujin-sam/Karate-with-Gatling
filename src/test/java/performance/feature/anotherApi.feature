Feature: PUT an Api

    Background:
        * url 'https://reqres.in/'
        * print 'the first_name is ', __gatling.c_userName
        * def payload = '{"name":' + __gatling.c_userName + ', "job": "zion resident"}'
        * json editPayload = payload
        * def pause = __gatling.pause

    Scenario: PUT method should return 200
        Given path '/api/users/2'
        And header karate-name = 'PUT-user-job'
        And request editPayload
        When method PUT
        Then status 200