# Car Configuration

El proceso de uso de la aplicación es elegir un modelo de coche y después puede escoger entre distintas opciones para cada pieza del coche, tanto de la parte interior como de la parte interior del coche.

Vistas:
1. Vista selección de modelo de coche
2. Vista con paneles cerrados de las distintas piezas del coche (Paneles)
  1. Elegir motor
  2. Elegir color
  3. Elegir tapicería
  4. Elegir extras
    1. Audio
    2. Pantalla
    3. Alerón
3. Vista precio final (Tiene un resumen de tus opciones)
4. Vista confirmar pago
5. Vista pedido confirmado

## Requisitos Funcionales
RF-1: Como usuario quiero poder elegir el modelo del coche
RF-2: Como usuario quiero poder elegir el color del exterior
RF-3: Como usuario quiero poder elegir la tapicería
RF-4: Como usuario quiero poder seleccionar los extras que tiene el coche
RF-5: Como usuario quiero poder ver un resumen de mi selección
RF-6: Como usuario quiero poder comprar el coche por la aplicación

## Requisitos no funcionales

## Estructura del código

- `lib`: contiene todo el código desarrollado en *Flutter*
- `lib/components`: código de distintas componentes gráficas que vamos a estar usando en toda la aplicación
- `lib/views`: código de las distintas vistas de la aplicación
- `lib/backend`: código con la lógica de negocio de la aplicación
- `lib/models`: código con algunos modelos con más lógica de negocio, de más alto nivel
