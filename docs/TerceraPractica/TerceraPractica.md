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
        1.  Comprobar almacenamiento
        2. Añadir configuraciones
        3. Buscar configuraciones
        4. Eliminar configuraciones
        5. Intentar eliminar una configuración dos veces

