Feature: Examples test page for Pets and User

  Background:
    * url 'https://petstore.swagger.io'
    # otra forma
    # GIVEN url 'https://petstore.swagger.io'

  @MethodGetUserPetStore
  Scenario:  verify a user with parameter , match option and RESPONSE ALL
    And path 'v2', 'user', 'Alexis06'
#    And param userId = 2
    When method get
    Then status 200
    And match response.id == 1004
    And match responseType == 'json'
    * print "RESPONSE:" , response

  @MethodAddUserPetStore
  Scenario: Add a new user to the petStore

    * def newUserPetStore = read('../json/addUserPetStore.json')
    Given path 'v2', 'user', 'createWithArray'
    When request newUserPetStore
    And method post
    Then status 200
    * def userName = response.username
    * print 'User Name:' , userName

    Given path 'v2', 'user', 'Alexis06'
    When method get
    Then status 200

  @MethodModifyUserPetStore
  Scenario: Modify an user in the petStore

    * def modifyUserPetStore = read('../json/modifyUserPetStore.json')
    Given path 'v2', 'user', 'Alexis06'
    When request modifyUserPetStore
    And method put
    Then status 200
    * def codResponse = response.code
    * print 'Code response:' , codResponse

    Given path 'v2', 'user', 'Alexis06'
    When method get
    Then status 200

  @MethodDeleteUserPetStore
  Scenario: Delete an user in the petStore

    Given path 'v2', 'user', 'Alexis30'
    When method delete
    Then status 200
    * def codResponse = response.code
    * print 'Code response:' , codResponse