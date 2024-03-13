# todo_practica_final

este es el proyecto final de tu practica:

- para instalar las dependencias ejecuta en terminal `flutter pub get`
- siempre mantener andando el `build_runner` para que este cree las entidades que generes, su comando es : `dart run build_runner watch`.

## Checklist de los puntos completados

-✅ login
-✅ registro
-✅ autenticacion de usuario
-🕐 crear una tarea

- eliminar tarea
- listar tareas filtradas por
  - mi dia
  - importante
  - pendientes
- CRUD proyectos
  - crear
  - listar
  - editar
  - modificar
- pantalla de configuracion
  -✅ cerrar sesion

## Se listaran los puntos que la aplicacion debe cumplir

Ojo, si tienes problemas con la realizacion de alguno de estos puntos , avisame, y lo resolvemos juntos.
si no te puedo ayudar , dejalo pendiente pero **no te estanques en un punto mucho rato, avanza con lo que puedas avanzar**.

hice 2 pantallas mas el menu en figma para que te bases en un diseño parecido, (imagenes estaran en carpeta readme)

# Aplicación 3: "To Do"

Aplicación buscara ser una réplica del "To Do" de Microsoft.
Tendrá las siguientes pantallas:

### Login:

Se solicitará credenciales de usuario:

- correo
- contraseña
  también la opción para recuperar la contraseña permitiéndole ingresar un correo de recuperación.
  Además, una opción para ir a la pantalla de registro si asi lo desea.
  Registro:
  Se solicitará al usuario:
- nombre y apellidos
- correo
- fecha nacimiento
- genero
- contraseña y verificación de contraseña
  para registrarse el usuario debe ser mayor de 18 años.

### Menú lateral:

El menú lateral contara con las siguientes opciones

- Mi día (pantalla de inicio)
  o Se listarán todas las tareas asignadas al usuario para el día actual
- Importante
  o Se listarán todas las tareas marcadas como importante
- Pendientes
  o Se listarán todas las tareas pendientes separadas por fecha
- Mis proyectos
  o Se listarán los proyectos en donde participo
  o Se pueden crear proyectos nuevos
- Separación (línea que separa sección del menú)
- Configuración
  o Se puede cambiar el color principal de la app
  o Se puede cambiar el tema (claro-oscuro) de la app
- Salir
  o Cierra sesión y envía a pantalla de login

### Pantalla “mi día”

En esta pantalla se debe poder visualizar la fecha en la que se está y el listado de tareas que se tiene separado por hora, si no se tiene ninguna tarea para el día mostrar mensaje “Nada que hacer por hoy, ¿buena o malas noticias?”
En el listado se debe poder marcar una tarea como importante, además debo poder marcarla como finalizada siempre y cuando no tenga listado de pasos a seguir o el listado este completo.
Debo poder crear una tarea rápida, solo el titulo y una vez creada, al seleccionarla que se desplieguen todas las opciones

#### Las notas tendrán las siguientes propiedades:

- Titulo
- Descripción
- Fecha limite
- Fecha de realización (por defecto la fecha actual)
- Integrantes (se debe poder elegir entre una lista de usuarios, usuario creador se incluye por defecto)
- Proyectos (se debe poder elegir entre una lista de proyectos, el encargado del proyecto se incluirá como integrante automáticamente)
- Listado de pasos a seguir (opcional), este listado puede contar con las siguientes propiedades:
  o Titulo
  o Descripción
  o Fecha límite (no puede ser mayor a la fecha límite de la tarea)
  o Integrante (solo un integrante asociado a la tarea)
  o Cada integrante deberá presionar un “comenzar” para que se comience a registrar el tiempo (se guarda el momento en que se presionó el botón)
  o Si un usuario se encuentra realizando una tarea, debe poder visualizar el tiempo y poder pausar el progreso en cualquier momento y en cualquier pantalla (botón flotante con la info)
- Etiquetas (ej.: error, mejora, nuevo, etc.)
- Importante: marca si es importante o no la tarea
- Comentario de rechazo (en caso de quitarle el estado de completada a una tarea)

Pantalla de importante, completadas y pendientes
Es como la pantalla “Mi dia” pero filtrada por el tipo correspondiente.
En pantalla completada se debe poder quitarle el estado a una tarea para que se continue trabajando, pero al hacerlo se debe dejar un comentario

### Pantalla proyectos

Se deben listar los proyectos en donde participo, mostrando el nombre del proyecto, la cantidad de tareas que tiene y los pendientes del día y se deben ordenar por el que tenga mas tareas en el día

Se podrá crear proyectos nuevos solicitando:

- Nombre proyecto
- Abreviación (por defecto las primeras 3 letras del nombre) Max 3 caracteres.
- Automáticamente se asignará el usuario creador como el encargado del proyecto, con posibilidad de cambiarlo.
