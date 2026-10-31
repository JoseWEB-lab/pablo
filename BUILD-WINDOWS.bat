@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title ShadowWorld - Build Forge 1.21.11

echo ==================================================
echo  ShadowWorld: Beyond Survival - Compilacion
echo  Minecraft 1.21.11 / Forge 61.2.4 / Java 21
echo ==================================================
echo.

where java >nul 2>&1
if errorlevel 1 (
  echo ERROR: Java no esta en PATH. Instala JDK 21 y vuelve a abrir CMD.
  pause
  exit /b 2
)

for /f "tokens=3" %%V in ('java -version 2^>^&1 ^| findstr /i "version"') do set "JAVA_VER=%%~V"
echo Java detectado: %JAVA_VER%
echo %JAVA_VER% | findstr /c:"21." >nul
if errorlevel 1 (
  echo ERROR: Se necesita Java 21. El proyecto apunta a Java 21.
  pause
  exit /b 3
)

set "GRADLE_CMD="
if exist "gradlew.bat" if exist "gradle\wrapper\gradle-wrapper.jar" set "GRADLE_CMD=call gradlew.bat"
if not defined GRADLE_CMD (
  where gradle >nul 2>&1
  if not errorlevel 1 set "GRADLE_CMD=gradle"
)
if not defined GRADLE_CMD (
  echo ERROR: No hay wrapper ni Gradle en PATH.
  echo Opcion A: instala Gradle 8.14.x y anadelo al PATH.
  echo Opcion B: copia gradlew, gradlew.bat y gradle\wrapper desde el MDK oficial.
  pause
  exit /b 4
)

if not exist "logs" mkdir logs
echo Ejecutando Gradle... Consulta logs\build-windows.log si hay errores.
%GRADLE_CMD% --no-daemon clean build > "logs\build-windows.log" 2>&1
if errorlevel 1 (
  echo ERROR: Gradle fallo. Ultimas lineas del registro:
  powershell -NoProfile -Command "Get-Content 'logs\build-windows.log' -Tail 35"
  pause
  exit /b 6
)

set "JAR=build\libs\shadowworld-1.0.0.jar"
if not exist "%JAR%" (
  echo ERROR: Gradle termino, pero no se encontro %JAR%.
  pause
  exit /b 7
)

jar tf "%JAR%" | findstr /x "META-INF/mods.toml" >nul
if errorlevel 1 (
  echo ERROR: El JAR no contiene META-INF/mods.toml.
  pause
  exit /b 8
)
jar tf "%JAR%" | findstr /x "com/shadowworld/ShadowWorld.class" >nul
if errorlevel 1 (
  echo ERROR: El JAR no contiene la clase principal compilada.
  pause
  exit /b 9
)

echo.
echo BUILD SUCCESSFUL
 echo JAR generado y comprobado: %JAR%
echo IMPORTANTE: falta probarlo en cliente y servidor Forge antes de publicarlo.
pause
exit /b 0
