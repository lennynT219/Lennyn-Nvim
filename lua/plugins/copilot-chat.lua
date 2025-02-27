-- Este archivo contiene la configuración para integrar los plugins de GitHub Copilot y Copilot Chat en Neovim.

-- Define los prompts para Copilot
-- Esta tabla contiene varios prompts que se pueden utilizar para interactuar con Copilot.
local prompts = {
  Explicar = "Por favor explica cómo funciona el siguiente código.", -- Prompt para explicar el código
  Revisar = "Por favor revisa el siguiente código y proporciona sugerencias para mejorarlo.", -- Prompt para revisar el código
  Tests = "Por favor explica cómo funciona el código seleccionado, luego genera pruebas unitarias para él.", -- Prompt para generar pruebas unitarias
  Refactorizar = "Por favor refactoriza el siguiente código para mejorar su claridad y legibilidad.", -- Prompt para refactorizar el código
  ArreglarCodigo = "Por favor arregla el siguiente código para hacerlo funcionar como se espera.", -- Prompt para arreglar el código
  ArreglarError = "Por favor explica el error en el siguiente texto y proporciona una solución.", -- Prompt para arreglar errores
  MejorarNombres = "Por favor sugiere mejores nombres para las siguientes variables y funciones.", -- Prompt para sugerir mejores nombres
  Documentacion = "Por favor genera documentación para el siguiente código.", -- Prompt para generar documentación
  JsDocs = "Por favor genera JsDocs para el siguiente código.", -- Prompt para generar JsDocs
  DocumentacionParaGithub = "Por favor genera documentación para el siguiente código lista para GitHub usando markdown.", -- Prompt para generar documentación para GitHub
  CrearPost = "Por favor crea un post de documentación para el siguiente código para publicarlo en redes sociales, como LinkedIn, debe ser profundo, bien explicado y fácil de entender. También debe ser divertido y atractivo.", -- Prompt para crear un post en redes sociales
  SwaggerApiDocs = "Por favor genera documentación para la siguiente API usando Swagger.", -- Prompt para generar documentación Swagger para la API
  SwaggerJsDocs = "Por favor escribe JSDoc para la siguiente API usando Swagger.", -- Prompt para generar Swagger JsDocs
  Resumir = "Por favor resume el siguiente texto.", -- Prompt para resumir un texto
  Ortografia = "Por favor corrige los errores de gramática y ortografía en el siguiente texto.", -- Prompt para corregir ortografía y gramática
  Redaccion = "Por favor mejora la gramática y redacción del siguiente texto.", -- Prompt para mejorar la redacción
  Conciso = "Por favor reescribe el siguiente texto para hacerlo más conciso.", -- Prompt para hacer un texto más conciso
}

-- Configuración del plugin
-- Esta tabla contiene la configuración de varios plugins usados en Neovim.
return {

  -- Configuración del plugin Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim", -- Cargar el plugin Copilot Chat
    opts = {
      prompts = prompts,
      system_prompt = "soy Lenin, me encanta la scream architecture, la clean architecture, la hexagonal architecture, y el patrón composition/presentational. también disfruto modularizar el código, usar una buena separation of concerns y mantenerlo bien limpio. quiero que la inteligencia artificial hable con mi estilo: profesional pero cercano,  sin signos de exclamación al inicio ni mayúsculas en la primera letra. que explique conceptos técnicos con ejemplos prácticos, estructurando la respuesta cuando sea necesario y metiendo algo de humor sutil. dale que va. Y cuando pongas código de respuesta, no agregues las líneas de código a las que pertenecen, y cualquier comentario que agregues al código hazlo en español",
      model = "gpt-4o",
      answer_header = "<- LennynT02 ->",
      window = {
        layout = "float",
      },
    },
  },
}
