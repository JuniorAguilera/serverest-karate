Feature: Actualizar usuario existente en ServeRest

  Background:
    * url 'https://serverest.dev'
    * path 'usuarios'

  Scenario: Crear y actualizar usuario por ID
    # Crear un usuario
    * def originalEmail = 'martin' + java.util.UUID.randomUUID() + '@mail.com'
    * def usuario =
    """
    {
      "nome": "Martin QA",
      "email": "#(originalEmail)",
      "password": "123456",
      "administrador": "true"
    }
    """
    Given request usuario
    When method POST
    Then status 201
    * def userId = response._id

    # Actualizar el usuario
    * def emailAtualizado = 'actualizado' + java.util.UUID.randomUUID() + '@mail.com'
    * def usuarioActualizado =
    """
    {
      "nome": "Martin Actualizado",
      "email": "#(emailAtualizado)",
      "password": "654321",
      "administrador": "false"
    }
    """
    Given path 'usuarios', userId
    And request usuarioActualizado
    When method PUT
    Then status 200
    And match response.message == "Registro alterado com sucesso"