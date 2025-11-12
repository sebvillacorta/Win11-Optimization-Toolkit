
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

**El uso de este repositorio es bajo tu propia responsabilidad.**

## 🛠️ Scripts de Automatización (PowerShell)

El directorio `/Scripts` contiene archivos de **PowerShell** diseñados para automatizar tareas repetitivas de optimización.

### 1. `Disable_Telemetry.ps1`

Este script se enfoca en la privacidad y el consumo de recursos al deshabilitar servicios, tareas programadas y entradas de registro relacionadas con la recopilación de datos y telemetría de Microsoft.

| Objetivo | Detalle Técnico |
| :--- | :--- |
| **Servicios** | Detiene y deshabilita servicios como `DiagTrack` (Experiencia del usuario y telemetría conectada) y `dmwappushsvc` (Servicio de envío de WAP de administración de dispositivos). |
| **Tareas Programadas** | Elimina tareas programadas que envían datos periódicamente a Microsoft. |
| **Registro** | Aplica ajustes clave en `HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection` para bloquear la telemetría. |

### 2. `Unnecessary_Apps_Removal.ps1`

Un script de *debloating* para remover aplicaciones preinstaladas (bloatware) que generalmente no son esenciales y consumen espacio y memoria.

* Utiliza `Get-AppxPackage` para identificar y remover aplicaciones como juegos, ciertas utilidades de Xbox o aplicaciones de medios.
* **Nota:** Se excluyen aplicaciones críticas del sistema.

### 3. `Performance_Power_Plan.ps1`

Un script sencillo que asegura la configuración del plan de energía en **Alto Rendimiento** para portátiles y equipos de escritorio, maximizando la velocidad de la CPU.

## ⚙️ Ajustes Manuales y Guías

El directorio `/Manual_Tweaks` contiene documentación que detalla configuraciones de bajo nivel para usuarios avanzados. Estos ajustes se recomiendan hacer manualmente para garantizar la compatibilidad con tu hardware específico.

### `Registry_Optimization.md`

Guía paso a paso para la modificación del Registro que afecta directamente el rendimiento y la latencia del sistema:

* **Ajustes de Prefetcher/Superfetch:** Cómo modificar el valor `EnablePrefetcher` y `EnableSuperfetch` para adaptar el comportamiento de caché a unidades SSD o HDD.
* **Optimizaciones de red:** Tweaks en `TcpAckFrequency` y `DisableNagleAlgorithm` para mejorar la latencia en juegos o aplicaciones de alta respuesta (con precaución).

### `Services_to_Disable.md`

Una lista curada de servicios de Windows que pueden ser deshabilitados o configurados en **Manual** sin afectar la funcionalidad básica del sistema.

* **Ejemplo:** Deshabilitar la función de fax si no se utiliza, o configurar Windows Search (`WSearch`) en manual si prefieres otras herramientas de indexación.

# Error de "No se puede cargar el archivo..." 
---

![img](https://github.com/sebvillacorta/Win11-Optimization-Toolkit/blob/2107edb6d5ddf6debfbafafc0bfe626d838aa0c9/error%20de%20scripst.png)


## 🛡️ Solución: Modificar la Política de Ejecución

Para permitir que tu script Disable_Telemetry.ps1 se ejecute, debes cambiar temporalmente la política de ejecución. Te recomiendo usar la política RemoteSigned, que es más segura que otras opciones porque solo permite scripts descargados de Internet si tienen una firma digital válida, pero permite ejecutar tus propios scripts creados localmente.

### Sigue estos pasos ejecutando PowerShell como Administrador:

# Paso 1: Verificar la Política Actual

Escribe el siguiente comando para ver cuál es tu política actual (probablemente sea Restricted):
PowerShell

    Get-ExecutionPolicy

# Paso 2: Cambiar la Política de Ejecución

Ejecuta el siguiente comando para establecer la política en RemoteSigned:
PowerShell

    Set-ExecutionPolicy RemoteSigned -Scope Process

# Explicación del Comando:

    Set-ExecutionPolicy: Es el cmdlet para cambiar la política.
    
    RemoteSigned: Permite ejecutar tus scripts locales sin restricciones.

    -Scope Process: ¡Clave de seguridad! Esto asegura que el cambio de política solo se aplique a la sesión de PowerShell actual y se      revierta a la política anterior automáticamente cuando cierres la ventana de PowerShell.
    Shutterstock

# Paso 3: Ejecutar el Script

Ahora que la política de la sesión actual está configurada correctamente, puedes ejecutar los script sin problemas:
PowerShell, provando el.

    .\Disable_Telemetry.ps1

Una vez que el script termine, puedes cerrar la ventana de PowerShell. La política de ejecución de tu sistema volverá a ser la que tenías originalmente (probablemente Restricted), manteniendo un buen nivel de seguridad para futuros scripts que puedas descargar.


## 💡 Cómo Contribuir

Si encuentras más *tweaks* de rendimiento o tienes sugerencias para mejorar los scripts, ¡las contribuciones son bienvenidas! Por favor, abre un *issue* o envía un *pull request*.

---

## 👨‍💻 Mis Habilidades Demostradas

* **System Optimization:** Conocimiento profundo para maximizar el rendimiento de Windows 11.
* **Automation & Bash Scripting:** Uso de scripts de PowerShell para automatizar tareas complejas.
* **SysAdmin / Server Configuration:** Aplicación de metodologías de *hardening* y gestión de servicios al entorno de escritorio.
* **Git:** Uso de control de versiones para gestionar y documentar los cambios.

