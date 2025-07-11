Feature: Registrar nuevo usuario en ServeRest

  Background:
    * url 'https://serverest.dev'
    * path 'usuarios'

  Scenario: Registrar un usuario con datos válidos
    * def randomEmail = 'martin' + java.util.UUID.randomUUID() + '@mail.com'
    * def usuario =
    """
    {
      "nome": "Martin QA",
      "email": "#(randomEmail)",
      "password": "123456",
      "administrador": "true"
    }
    """
    Given request usuario
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
    And match response._id != null