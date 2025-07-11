# ServeRest API Automation – Karate DSL
Karate DSL+ Junit+ Maven + Java + Cucumber

Este proyecto automatiza pruebas de los endpoints de usuarios del sistema [ServeRest](https://serverest.dev) utilizando **Karate DSL**.

---

## 🚀 Tecnologías utilizadas

- [Karate DSL](https://github.com/karatelabs/karate) v1.4.1
- Java 11+
- Maven
- JUnit 5
- IntelliJ IDEA

---

## 📁 Estructura del proyecto

<img width="467" height="490" alt="image" src="https://github.com/user-attachments/assets/7043ba6f-4211-4de2-930a-e672625e5493" />

## 📜 Escenarios automatizados

| Endpoint             | Archivo `.feature`             | Validaciones clave                                |
|----------------------|--------------------------------|---------------------------------------------------|
| `GET /usuarios`      | `listar_usuarios.feature`      | Status 200, estructura de usuarios                |
| `POST /usuarios`     | `registrar_usuario.feature`    | Status 201, ID generado, mensaje de éxito         |
| `GET /usuarios/{id}` | `buscar_usuario.feature`       | Status 200, datos coinciden con creación          |
| `PUT /usuarios/{id}` | `actualizar_usuario.feature`   | Status 200, mensaje de éxito, confirmación por GET|
| `DELETE /usuarios/{id}` | `eliminar_usuario.feature`  | Status 200, mensaje correcto, confirmación de eliminación|

---

## ▶️ Ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/TU_USUARIO/serverest-karate.git
cd serverest-karate

2. Ejecutar las pruebas
En el archivo UsuariosRunnerTest.java cambiar la linea 7 y escribir el test a correr:
return Karate.run("TEST_EJECUTAR").relativeTo(getClass());
TEST_EJECUTAR:
-eliminar_usuario
-listar_usuarios
-registrar_usuario
-buscar_usuario
-actualizar_usuario
Ahora ejecutar el siguiente comando: mvn test

3. Ver el reporte HTML
target/karate-reports/karate-summary.html

✍️ Autor
Junior Aguilera

---

## 📘 2. Contenido para `AUTOMATION-STRATEGY.md`

Crea también este archivo en la raíz del proyecto.

# Estrategia de Automatización – API ServeRest

## 🎯 Objetivo

Automatizar pruebas funcionales para los endpoints de usuarios del sistema [https://serverest.dev](https://serverest.dev) validando flujos completos: creación, consulta, actualización y eliminación.

---

## 🧰 Herramientas

- Karate DSL (framework especializado en pruebas API)
- JUnit 5 (runner de tests)
- Java + Maven
- Reportes HTML integrados

---

## 🧪 Enfoque aplicado

- Pruebas **End-to-End** usando Karate y Gherkin (`.feature`)
- Generación de datos dinámicos (`UUID` en emails)
- Reutilización de variables (`_id`) entre pasos
- Validación de estructuras JSON (`match`, `contains`)
- Verificación de errores esperados (ej. usuario no encontrado)

---

## 🧪 Tipos de pruebas

- ✅ Casos positivos (status 200/201)
- ❌ Casos negativos (ej. `GET` después de `DELETE`)
- 🔁 Pruebas encadenadas (crear → actualizar → consultar)
- 🧼 Limpieza: eliminación tras creación

---

## 📝 Observaciones

- Todas las pruebas son independientes y ejecutables en cualquier orden
- Se usa `uuid` para evitar conflictos con emails repetidos
- Karate permite mantener el código legible, modular y sin Java adicional

---

## 🏁 Resultados

- Todos los escenarios pasaron exitosamente
- Reportes generados en `target/karate-reports`
- Proyecto compatible con CI/CD vía Maven

