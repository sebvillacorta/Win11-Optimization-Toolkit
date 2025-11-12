# SCRIPT: Disable_Telemetry.ps1
# OBJETIVO: Reducir la telemetría y la recopilación de datos en Windows 11.

Write-Host "Iniciando la desactivación de servicios de Telemetría..." -ForegroundColor Yellow

# --- 1. Deshabilitar Servicios Clave de Telemetría ---

$ServicesToDisable = @(
    "DiagTrack",       # Experiencia del usuario y telemetría conectada
    "dmwappushsvc",    # Servicio de envío de WAP de administración de dispositivos
    "TroubleshooterSvc" # Servicio de Solución de problemas
)

foreach ($ServiceName in $ServicesToDisable) {
    try {
        # Detener el servicio si está corriendo
        Stop-Service -Name $ServiceName -Force -ErrorAction SilentlyContinue
        # Deshabilitar el inicio del servicio
        Set-Service -Name $ServiceName -StartupType Disabled -ErrorAction Stop
        Write-Host "✅ Servicio '$ServiceName' detenido y deshabilitado." -ForegroundColor Green
    } catch {
        Write-Host "⚠️ Error al procesar el servicio '$ServiceName': $($_.Exception.Message)" -ForegroundColor Red
    }
}

# --- 2. Modificaciones al Registro de Windows (Privacidad) ---

Write-Host "`nAplicando ajustes de Registro para la privacidad..." -ForegroundColor Yellow

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$ValueName = "AllowTelemetry"
$ValueData = 0

try {
    # Crea la clave si no existe
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Establece el valor de AllowTelemetry a 0 (más restrictivo)
    Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord -Force
    Write-Host "✅ Registro modificado: Telemetría restringida." -ForegroundColor Green
} catch {
    Write-Host "❌ Error al modificar el Registro: $($_.Exception.Message)" -ForegroundColor Red
}


# --- 3. Desactivar el Índice de Búsqueda (Opcional para rendimiento extremo) ---

Write-Host "`nDeshabilitando el Servicio de Búsqueda de Windows (WSearch)..." -ForegroundColor Yellow

try {
    # Deshabilitar para evitar indexación constante, útil en PCs con SSD modernos o bajo uso
    Stop-Service -Name "WSearch" -Force -ErrorAction SilentlyContinue
    Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction Stop
    Write-Host "✅ Servicio 'WSearch' detenido y deshabilitado." -ForegroundColor Green
} catch {
    Write-Host "⚠️ Error al procesar el servicio 'WSearch': $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n--- Proceso de optimización de Telemetría completado. ---" -ForegroundColor Cyan