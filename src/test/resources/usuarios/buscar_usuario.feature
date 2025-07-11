Feature: Buscar usuario por ID en ServeRest

  Background:
    * url 'https://serverest.dev'
    * path 'usuarios'

  Scenario: Registrar y buscar usuario por ID
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
    # Crear usuario
    Given request usuario
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
    * def userId = response._id

    # Consultar por ID
    Given path 'usuarios', userId
    When method GET
    Then status 200
    And match response.nome == usuario.nome
    And match response.email == usuario.email
    And match response.administrador == usuario.administrador