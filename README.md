# Música Pal Héctor 🎵

Reproductor de música para iOS con 4 canciones incluidas. Funciona sin internet.

**PARA USUARIOS DE MAC ÚNICAMENTE**

---

# 🚀 INSTALACIÓN (4 PASOS)

## PASO 1: DESCARGAR
```bash
cd ~/Desktop
git clone https://github.com/tagaa8/musica_ios.git
cd musica_ios
```

## PASO 2: ABRIR EN XCODE
```bash
open MusicaPalHector/MusicaPalHector.xcodeproj
```

**Si te da error "project is damaged":**
```bash
cd ~/Desktop/musica_ios
git pull
open MusicaPalHector/MusicaPalHector.xcodeproj
```

## PASO 3: SELECCIONAR SIMULADOR
En Xcode, arriba donde dice "My Mac", selecciona **iPhone 15 Pro**

## PASO 4: EJECUTAR
Click en el botón **▶️** y espera 2-3 minutos

---

# ✅ ACTUALIZACIONES

Para obtener nuevas versiones:
```bash
cd ~/Desktop/musica_ios
git pull
```

No necesitas mover archivos ni recrear proyecto.

---

# 🔧 ERRORES COMUNES Y SOLUCIONES

## Error: "AddInstanceForFactory" o "Invalid frame dimension" (loop infinito)
**Solución:**
1. En Xcode: `Product` → `Clean Build Folder` (Cmd+Shift+K)
2. Espera que termine
3. Dale ▶️ nuevamente

## Error: "No ObservableObject of type AudioManager found"
**Solución:**
1. En Xcode: `Product` → `Clean Build Folder` (Cmd+Shift+K)
2. Espera que termine
3. Dale ▶️ nuevamente

## Error: "Failed to launch app in reasonable time"
**Solución:**
1. Cambia simulador a **iPhone 14** (en vez de iPhone 15 Pro)
2. Dale ▶️ y espera **5 minutos completos**
3. Si sigue sin funcionar, ejecuta:
```bash
killall Xcode
killall Simulator
xcrun simctl shutdown all
xcrun simctl erase all
```
4. Abre Xcode de nuevo y repite

## Error: "Build input file cannot be found"
**Solución:**
1. En Xcode, click en el proyecto (carpeta azul)
2. Ve a TARGETS → MusicaPalHector → Build Phases
3. En "Compile Sources", busca archivos en rojo y elimínalos
4. Dale ▶️ nuevamente

## Error: "The project 'MusicaPalHector' is damaged and cannot be opened"
**Solución DEFINITIVA:**
1. Cierra Xcode completamente
2. Ejecuta estos comandos:
```bash
cd ~/Desktop/musica_ios
git pull
rm -rf ~/Library/Developer/Xcode/DerivedData/*
open MusicaPalHector/MusicaPalHector.xcodeproj
```
3. Espera a que abra completamente
4. Si sigue dando error, reinicia tu Mac y repite

## Error: "Cannot find module" o "Cannot find 'AudioManager'"
**Solución:**
```bash
# En terminal:
cd ~/Desktop/musica_ios
git pull
```
Luego abre Xcode y dale ▶️

---

# 📱 FUNCIONES DE LA APP

- ✅ Reproducir 4 canciones incluidas
- ✅ Play/Pause, Siguiente, Anterior  
- ✅ Shuffle y Repeat
- ✅ Favoritos (botón ❤️)
- ✅ Playlists personalizadas
- ✅ Top 25 automático
- ✅ Visualizador de ondas
- ✅ Control desde pantalla de bloqueo

---

---

# 📱 PROBAR EN TU iPHONE (SIN APP STORE)

## PASO 1: CONECTAR iPhone
1. Conecta tu iPhone a la Mac con cable USB
2. En el iPhone: `Configuración` → `Privacidad` → `Modo de desarrollador` → **Activar**
3. En el iPhone: `Configuración` → `General` → `Gestión de perfiles` → Confía en tu Apple ID

## PASO 2: CONFIGURAR XCODE
1. En Xcode, donde dice **iPhone 15 Pro**, selecciona **tu iPhone**
2. Si es la primera vez: Xcode pedirá confiar en tu Mac desde el iPhone
3. En el iPhone aparecerá: **"¿Confiar en este dispositivo?"** → **Confiar**

## PASO 3: INSTALAR EN iPhone
1. Dale ▶️ en Xcode (como siempre)
2. Xcode compilará e instalará la app en tu iPhone
3. **IMPORTANTE**: La app solo funcionará 7 días sin cuenta de desarrollador

## PASO 4: SI DICE "DESARROLLADOR NO CONFIABLE"
1. Ve a: `Configuración` → `General` → `Gestión de perfiles y dispositivos`
2. Busca tu Apple ID y dale **"Confiar"**
3. Ya puedes usar la app en tu iPhone

**NOTA**: La app se instala localmente, NO se sube al App Store. Es solo para pruebas.

---

# 🎵 CÓMO AGREGAR O QUITAR CANCIONES

## UBICACIÓN DE LAS CANCIONES
Las canciones están en: `MusicaPalHector/MusicaPalHector/Resources/`

Actualmente incluye:
- `song1.mp3` - Canción 1
- `song2.mp3` - Canción 2  
- `song3.mp3` - Canción 3
- `song4.mp3` - Canción 4

## PARA AGREGAR NUEVAS CANCIONES:

### PASO 1: PARAR LA APP
1. En Xcode, click en el botón **⏹️** (Stop)
2. O presiona **Cmd+.**

### PASO 2: AGREGAR ARCHIVO MP3
1. Arrastra tu archivo `.mp3` a la carpeta `MusicaPalHector/MusicaPalHector/Resources/`
2. Cuando aparezca el diálogo, asegúrate de marcar:
   - ✅ **"Copy items if needed"**
   - ✅ **"Add to target: MusicaPalHector"**
3. Click **"Add"**

### PASO 3: ACTUALIZAR EL CÓDIGO
1. Abre `MusicaPalHector/MusicaPalHector/Managers/DataManager.swift`
2. En la función `loadSongs()`, agrega tu canción:

```swift
Song(
    id: 5, // Siguiente número
    title: "Tu Canción",
    artist: "Tu Artista", 
    filename: "tu_archivo.mp3" // El nombre exacto del archivo
)
```

### PASO 4: EJECUTAR DE NUEVO
1. Click en **▶️** en Xcode
2. La app se reinstalará con las nuevas canciones

## PARA QUITAR CANCIONES:

### PASO 1: PARAR LA APP
1. En Xcode, click en **⏹️** (Stop)

### PASO 2: ELIMINAR ARCHIVO
1. En Xcode, click derecho en el archivo `.mp3` en `Resources/`
2. Selecciona **"Delete"** → **"Move to Trash"**

### PASO 3: ACTUALIZAR EL CÓDIGO
1. Abre `MusicaPalHector/MusicaPalHector/Managers/DataManager.swift`
2. Elimina la entrada correspondiente de la función `loadSongs()`

### PASO 4: EJECUTAR DE NUEVO
1. Click en **▶️** en Xcode
2. La canción desaparecerá de la app

## FORMATOS SOPORTADOS
- ✅ MP3
- ✅ M4A
- ✅ WAV
- ❌ FLAC (no compatible con iOS)

**IMPORTANTE**: Después de cualquier cambio, siempre para la app y ejecuta de nuevo para ver los cambios.

---

**Si sigues estos pasos exactos, la app funcionará sin errores.**