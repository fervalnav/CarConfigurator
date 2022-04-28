---
title: Tercera Práctica
author:
    - Sergio Quijano Rey
    - alguien mas
date: 28.04.2022
geometry: margin=3.0cm
---

# Notas generales

Para especificar el diseño de los tests, usaremos la plantilla que hemos usado en el examen de teoría asíncrono. Plantilla que ha sido dada por los profesores de la asignatura.

# Pruebas unitarias

1. `CarConfigurationRepository`
    - **Condiciones**: El repositorio funciona como se espera. Se realizan las siguientes operaciones con éxito: añadir configuraciones configuraciones, buscar configuraciones existentes, eliminar configuraciones, los identificadores dan el comportamiento esperado (no se añaden configuraciones que ya existen, no tiene efecto borrar dos veces la misma configuración)
    - **Datos requeridos**: Partimos de unos datos iniciales para realizar las comprobaciones. Se crean en `create_basic_repo()`
    - **Casos de prueba**:
        1. Comprobar almacenamiento
        2. Añadir configuraciones
        3. Buscar configuraciones
        4. Eliminar configuraciones
        5. Intentar eliminar una configuración dos veces
2. `ActiveConfigurationRepository`
    - **Condiciones**: el repositorio con la configuración actual funciona como se espera. Podemos cambiar la configuración activa en ese momento, el modelo, color, tapicería y extra. El algoritmo que calcula el precio funciona correctamente
    - **Datos requeridos**: el repositorio parte de una configuración activa por defecto. Para los modelos, colores, tapicerías y extras usamos unas listas prefijadas en el fichero `tests/ActiveConfiguration_test.dart`, para servir como opciones a usar
    - **Casos de prueba**:
        1. Activar una configuración en concreto
        2. Hacer `set` del modelo
        3. Hacer `set` del color
        4. Hacer `set` de la tapicería
        5. Hacer `set` del extra
        6. El cómputo del precio es correcto para un caso concreto
3. `Option`
    - **Condiciones**: la clase `Option`, que constituye una parte fundamental de nuestro modelo, funciona como se espera
    - **Datos requeridos**: por la simpleza de la clase, al principio de cada caso de test creamos una opción sobre la que vamos a realizar las comprobaciones
    - **Casos de prueba**:
        1. Los datos de la opción son correctos
        2. El cálculo del precio asociado a las opciones es correcto

\newpage

# Pruebas de widgets

1. Pruebas sobre la página principal
    - **Condiciones**: la página principal funciona correctamente.
    - **Datos requeridos**: reinicializamos el `DataController`, porque es un `singleton` y queremos que las pruebas corran sobre un estado *inicial* de la aplicación
    - **Casos de prueba**:
        1. Eliminar una configuración almacenada y comprobar que se ha borrado
        2. Al pulsar en configurar, se debe cambiar la vista a la configuración
2.
