Feature: Examples test page POST


  @MethodAdUser
  Scenario: Add a new user with
    Given url "https://reqres.in/api/users"
    * headers { "x-api-key": "reqres-free-v1"}
    And request {"name": "morpheus" , "job": "leader"}
    When method post
    * karate.log(response)
    Then status 201


  @MethodPost
Scenario: Add a new user with match validation
  Given url "https://reqres.in/api/users"
  * headers { "x-api-key": "reqres-free-v1"}
  And request {"name": "morpheus" , "job": "leader"}
  When method post
  * karate.log(response)
  Then status 201
  And match response == "#notnull"
  And match response.name == "morpheus"

  @MethodPostWithJson
  Scenario: Add a new user with match validation and comparison with json file
    Given url "https://reqres.in/api/users"
    * headers { "x-api-key": "reqres-free-v1"}
    And request {"name": "morpheus" , "job": "leader"}
    When method post
    * karate.log(response)
    Then status 201
    And match response == read('../json/register.json')
