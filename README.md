# ShadowWorld: Beyond Survival — fuente ampliada

**Objetivo declarado:** Minecraft Java 1.21.11, Forge 61.2.4, Java 21.  
**ID:** `shadowworld` · **Versión fuente:** `1.0.0`

## Contenido que sí está implementado en el código fuente

- Registro de tres familias de materiales: Sombra, Lumenita y Emberita.
- Minerales normales y de pizarra profunda, fragmentos/cristales, lingotes y bloques de almacenamiento.
- Nueve herramientas de mano: tres picos, tres palas y tres azadas, con materiales, durabilidad y rendimiento distintos.
- Recetas de fundición, alto horno, compresión/descompresión de bloques, picos, palas y azadas.
- Tablas de botín de los minerales con bonus de Fortuna.
- Generación natural de minerales en el Overworld mediante configured features, placed features y Forge biome modifiers.
- Avances vanilla para el primer hallazgo de cada material; Minecraft guarda y sincroniza los avances.
- Texturas pixel art, modelos y traducciones es-ES/en-US.
- Los bloques se etiquetan como minables con pico y requieren herramienta de nivel hierro.

## Funciones que NO están completas todavía

Esta fuente no implementa conjuntos de armadura, estructuras explorables, una guía interactiva, un sistema propio de descubrimientos distinto de avances vanilla, persistencia extra por jugador ni un panel/configuración Forge activa. Tampoco hay pruebas reales de cliente/servidor. No se deben dar por realizadas.

## Construcción

El proyecto usa ForgeGradle 7, el estilo de proyecto de los ejemplos oficiales de Forge para 1.21.11 y Java 21. En el entorno de esta entrega no se pudo descargar el MDK ni las dependencias Forge, y tampoco había Gradle/wrapper instalado. Por tanto no existe aquí una compilación demostrada.

### En Windows

1. Instala un JDK 21 de 64 bits y comprueba `java -version`.
2. Descarga el MDK oficial de Forge 1.21.11–61.2.4 desde https://files.minecraftforge.net/net/minecraftforge/forge/index_1.21.11.html.
3. Extrae el MDK en una carpeta aparte y copia a la raíz de este proyecto `gradlew`, `gradlew.bat` y `gradle/wrapper/`.
4. En CMD, dentro de la carpeta del proyecto, ejecuta:
   ```bat
   gradlew.bat --version
   gradlew.bat build
   ```
5. El JAR, si la compilación acaba con `BUILD SUCCESSFUL`, aparecerá en `build\libs\shadowworld-1.0.0.jar`.
6. Prueba en una instancia limpia del cliente Forge y en un servidor dedicado. No uses un mundo importante sin copia de seguridad.

## Instalación tras compilar y probar

Copia el JAR en `mods` tanto del cliente como del servidor dedicado. Ambos deben usar Minecraft 1.21.11 y Forge 61.2.4 compatible.

## Estado de pruebas de esta entrega

- Archivos JSON parseables: comprobación automatizada local.
- PNGs 16×16: generados localmente.
- JAR compilado: NO.
- `runClient`: NO.
- `runServer`: NO.
- Generación real dentro de Minecraft: NO verificada.
