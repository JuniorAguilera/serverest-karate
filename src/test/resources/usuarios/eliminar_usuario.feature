Feature: Eliminar usuario existente en ServeRest

    Background:
        * url 'https://serverest.dev'
        * path 'usuarios'

    Scenario: Crear, eliminar y validar que usuario no existe
    # Crear un usuario
        * def email = 'martin' + java.util.UUID.randomUUID() + '@mail.com'
        * def usuario =
    """
    {
      "nome": "Martin QA Delete",
      "email": "#(email)",
      "password": "123456",
      "administrador": "true"
    }
    """
        Given request usuario
        When method POST
        Then status 201
        * def userId = response._id

    # Eliminar usuario
        Given path 'usuarios', userId
        When method DELETE
        Then status 200
        And match response.message == "Registro excluído com sucesso"

    # Verificar que ya no existe
        Given path 'usuarios', userId
        When method GET
        Then status 400
        And match response.message == "Usuário não encontrado"