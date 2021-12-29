Feature: Test for Countrylayer apis.

  Background: Define Url
    * def dataInput = read('/data/countryLayerData.json')
    * print dataInput.key
    * param access_key = dataInput.key
    Given url 'http://api.countrylayer.com/v2/'

  @Test
  Scenario: get all countries
    Given path 'all'
    When method Get
    Then status 200

  @Test
  Scenario: get specific countries by alphacode US
    Given path 'alpha/'
    And path alpha2Code = dataInput.code1
    When method Get
    Then status 200
    And match response.name contains 'United States of America'
    And match response.capital contains 'Washington, D.C.'


  @Test
  Scenario: get specific countries by alphacode DE
    Given path 'alpha/'
    And path alpha2Code = dataInput.code2
    When method Get
    Then status 200
    And match response.name contains 'Germany'
    And match response.capital contains 'Berlin'

  @Test
  Scenario: get specific countries by alphacode GB
    Given path 'alpha/'
    And path alpha2Code = dataInput.code3
    When method Get
    Then status 200
    And match response.name contains 'United Kingdom of Great Britain and Northern Ireland'
    And match response.capital contains 'London'

  @Test
  Scenario: validate new country
    Given path 'name/addNewCountry'
    And request
    """
    {name: "Test Country", alpha2_code: "TC",alpha3_code: "TCY"}
    """
    When method Post
    Then status 404
    And match response.message contains 'Not Found'

