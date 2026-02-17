Feature: Examples test page GET

  Background:
    Given url 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token?'
    * def credentials = { scope: 'offline_access', grant_type:  'password', username: 'api-user4@iwt.net', password: 'b3z0nV0cLO', client_id: '0oahdhjkutaGcIK2M4x6' }
    And form fields credentials
    When method post
    * def token = response.access_token
    * print "El token es:", token

  @Authorization_1
  Scenario: Authorization airplane data
    Given url 'https://api.instantwebtools.net/v2/airlines/1'
    * header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    * match response.name == "Sri Lankan Airways"
    * print response
