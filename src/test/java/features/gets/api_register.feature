Feature: Examples to register user type 1

@Register
Scenario: Register Users type 1
Given url 'https://reqres.in/api/register'
* def json = read('../json/register.json')
Given request json
When method get
And status 403
* print response
* def name = response.data[0].name
* match name == "cerulean"
