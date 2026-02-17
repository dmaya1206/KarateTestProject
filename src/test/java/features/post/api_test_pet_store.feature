Feature: Examples test page POST

Background:
  * url 'https://petstore.swagger.io'

  @MethodAddPet
  Scenario: Add a new pet

    * def newPet = read('../json/addPet.json')
    Given path '/v2/pet'
    When request newPet
    And method post
    Then status 200
    * def petId = response.id
    * print 'pet Id:' , petId

    Given path '/v2/pet' , petId
    When method get
    Then status 200
    And match response.id == petId