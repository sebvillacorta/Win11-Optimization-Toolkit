
![img](https://github.com/sebvillacorta/Win11-Optimization-Toolkit/blob/main/Screenshot%202025-11-10%20152006.png?raw=true)

<div align="center">
    
# Win11-Optimization-Toolkit

  <a href="https://github.com/sebvillacorta" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-sebvillacorta-000000?style=flat-square&logo=github&logoColor=white" alt="GitHub"/>
  </a>

  <!-- LinkedIn -->
  <a href="https://www.linkedin.com/in/sebastian-raul-villacorta-114719368/" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-Sebastián_Raúl_Villacorta-000000?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"/>
  </a>

  <!-- TikTok -->
  <a href="https://www.tiktok.com/@revosttt" target="_blank">
    <img src="https://img.shields.io/badge/TikTok-@revosttt-000000?style=flat-square&logo=tiktok&logoColor=white" alt="TikTok"/>
  </a>

  <!-- Email -->
  <a href="mailto:sssebastianraul@gmail.com">
    <img src="https://img.shields.io/badge/Email-sssebastianraul@gmail.com-000000?style=flat-square&logo=gmail&logoColor=white" alt="Email"/>
  </a>

</div>


## Introducción

Este repositorio es una colección de scripts y guías detalladas para optimizar Windows 11 en términos de rendimiento, privacidad y consumo de recursos. El objetivo es proporcionar herramientas reproducibles para el debloating del sistema operativo y la aplicación de ajustes que mejoran la experiencia general de uso.

Como profesional enfocado en System Optimization y SysAdmin, creo que un sistema operativo limpio y afinado es fundamental.

## ⚠️Advertencia y Responsabilidad

¡Importante! La ejecución de scripts de optimización o la modificación directa del Registro de Windows conlleva riesgos de inestabilidad del sistema.

## Antes de ejecutar cualquier script o aplicar cualquier ajuste manual:

### Requisitos Previos: Activar la Protección del Sistema 

Si la protección del sistema no está activada, no podrás crear puntos de restauración. 

En la barra de búsqueda de Windows, escribe "crear un punto de restauración" y haz clic en el resultado correspondiente para abrir la ventana Propiedades del sistema.

En la pestaña "Protección del sistema", selecciona la unidad para la que deseas crear el punto de restauración (generalmente el Disco local (C:) donde está instalado el sistema operativo).

     -Haz clic en el botón "Configurar".
     -Selecciona la opción "Activar protección del sistema".
     
Opcionalmente, ajusta el "Uso máximo de espacio en disco" que se destinará a los puntos de restauración (un 5-10% suele ser suficiente). Una vez que se alcanza este límite, los puntos más antiguos se eliminan para dejar espacio a los nuevos.




### Cómo Crear el Punto de Restauración Manualmente

Una vez activada la protección del sistema, sigue estos pasos:

En la misma ventana "Propiedades del sistema", en la pestaña "Protección del sistema", haz clic en el botón "Crear".
Aparecerá una pequeña ventana pidiéndote que escribas un nombre o una descripción para el punto de restauración. Elige un nombre que te ayude a recordarlo fácilmente, como "Antes de instalar nuevo software" o la fecha actual.

    -Haz clic en "Crear".
    
Windows comenzará a crear el punto de restauración. Este proceso puede tardar unos instantes.
Cuando finalice, aparecerá un mensaje de confirmación indicando que 

    -"El punto de restauración se creó correctamente".
    -Haz clic en "Cerrar". 

Se recomienda crear un punto de restauración antes de realizar cambios importantes en el sistema, como instalar nuevos controladores o programas, para poder revertir fácilmente el sistema a un estado anterior si algo sale mal. 



