Feature: Listar todos los usuarios desde ServeRest

  Background:
    * url 'https://serverest.dev'
    * path 'usuarios'

  Scenario: Obtener todos los usuarios existentes
    Given method GET
    Then status 200
    And match response.usuarios == '#notnull'
    And match response.usuarios[0] contains { nome: '#string', email: '#string', password: '#string' }