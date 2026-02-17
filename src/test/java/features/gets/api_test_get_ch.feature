Feature: Examples test page GET

 Background:
   * url 'https://jsonplaceholder.typicode.com'
    # otra forma
    # GIVEN url 'https://jsonplaceholder.typicode.com'

  @MethodGet
  Scenario: To resolve the expression
    Given url 'https://api.mathjs.org/v4/?expr=2*(7-3)'
    When method get
    Then status 200

  @MethodOneUser
  Scenario: verify an specific user
  //  Given url 'https://jsonplaceholder.typicode.com/posts'
    When path 'posts'
    And method get
    Then status 200

  @MethodAllUserWhitParam
  Scenario: verify all the user with parameter
   // Given url 'https://jsonplaceholder.typicode.com'
    When method get
    And path 'posts'
    And param userId = 1
    Then status 200

#  @MethodMatch
#  Scenario:  verify a user with parameter and with match option
#  // Given url 'https://jsonplaceholder.typicode.com'
#    When method get
#    And path 'posts'
#    And param userId = 5
#    Then status 200
#    And match $.userId == '5'

  @MethodMatchResponseAll
  Scenario:  verify a user with parameter , match option and RESPONSE ALL
    And path 'posts'
    And param userId = 2
    When method get
    Then status 200
    And match responseType == 'json'
    * print "RESPONSE:" , response

  @MethodMatchResponseOne
  Scenario: verify a user, with parameter , match option and * print for subindex
    And path 'posts'
    And param userId = 2
    When method get
    Then status 200
    And match responseType == 'json'
    * print "RESPONSE:" , response [0]

  @MethodMatchResponseOneAndSpecificField
  Scenario: verify a user, with parameter , match option and * print for subindex
    And path 'posts'
    And param userId = 2
    When method get
    Then status 200
    And match responseType == 'json'
    * print "RESPONSE:" , response [0].title

  @EvaluateFalseTrueCondition
  Scenario: verify a user, with parameter , match option and * print for subindex
    And path 'posts'
    And param userId = 2
    When method get
    Then status 200
    And assert response.length > 1
    And match responseType == 'json'
