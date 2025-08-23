# Música Pal Héctor 🎵

Reproductor de música para iOS con canciones incluidas. No requiere internet.

---

# 🚀 INSTALACIÓN PASO A PASO

## PASO 1: INSTALAR XCODE

1. **Abre App Store** en tu Mac
2. **Busca "Xcode"** y descárgalo (es gratis, ~7GB)
3. **Abre Xcode** por primera vez
4. **Acepta términos** y deja que instale componentes adicionales (5-10 min)
5. **Descarga iOS Simulator** cuando lo pida (~7GB, 20-40 min) - ES NORMAL Y NECESARIO

## PASO 2: CLONAR EL REPOSITORIO

```bash
# Abre Terminal (Cmd+Espacio, busca "Terminal")
cd ~/Desktop
git clone git@github.com:tagaa8/musica_ios.git
cd musica_ios
```

**RESULTADO:** Ahora tienes esta estructura en tu Desktop:
```
📁 Desktop/
  📁 musica_ios/                    ← EL REPOSITORIO PRINCIPAL
    📁 MusicaPalHector/             ← PROYECTO XCODE (NO ABRAS ESTE)
      📁 MusicaPalHector.xcodeproj  ← ESTÁ CORRUPTO
      📁 MusicaPalHector/           ← CARPETA CON ARCHIVOS
        📁 Views/                   ← AQUÍ ESTÁN LOS ARCHIVOS QUE NECESITAS
          📄 ContentView.swift
          📄 AllSongsView.swift
          📄 etc...
        📁 Models/
          📄 Song.swift
        📁 Services/
          📄 AudioManager.swift
          📄 DataManager.swift
        📁 Resources/
          📁 Songs/
            🎵 EntregaTotal.mp3
            🎵 CaifanesMiedo.mp3
            🎵 UnHombreNormal.mp3
            🎵 VicenteFernandezGema.mp3
```

## PASO 3: CREAR PROYECTO NUEVO EN XCODE

**NO abras el proyecto existente (está corrupto). Crea uno nuevo:**

1. **Abre Xcode**:
```bash
open /Applications/Xcode.app
```

2. **Create New Project**

3. **Configura el proyecto:**
   - Selecciona: **iOS**
   - Selecciona: **App**
   - Click: **Next**
   - **Product Name**: `MusicaPalHector`
   - **Team**: Tu Apple ID (o "None")
   - **Organization Identifier**: `com.hector.MusicaPalHector`
   - **Language**: Swift
   - **Interface**: **SwiftUI** ← SÚPER IMPORTANTE
   - **Use Core Data**: NO ❌
   - **Testing System**: **None** (cambia de "SwiftTestingWithXCTest" a "None")
   - **Storage**: **None** (déjalo como está)
   - Click: **Next**
   - **IMPORTANTE - GUARDA EN**: `~/Desktop/MiProyectoNuevo/` (NO dentro de musica_ios)
   - Click: **Create**

**RESULTADO:** Ahora tienes DOS carpetas en Desktop:
```
📁 Desktop/
  📁 musica_ios/                    ← REPOSITORIO CON ARCHIVOS FUENTE
  📁 MiProyectoNuevo/              ← TU PROYECTO NUEVO DE XCODE
    📁 MusicaPalHector.xcodeproj    ← ESTE SÍ FUNCIONA
    📁 MusicaPalHector/             ← CARPETA DE TU PROYECTO NUEVO
```

## PASO 4: LIMPIAR PROYECTO NUEVO

**En Xcode (tu proyecto nuevo):**

1. **Elimina ContentView.swift** que viene por defecto:
   - Click derecho en "ContentView.swift" → Delete → Move to Trash

## PASO 5: COPIAR ARCHIVOS DEL REPOSITORIO AL PROYECTO NUEVO

### 5.1 ABRIR FINDER CON EL REPOSITORIO

```bash
# Abre Finder en la carpeta con los archivos fuente
open ~/Desktop/musica_ios/MusicaPalHector/MusicaPalHector
```

**DEBES VER:** Una ventana de Finder con estas carpetas:
- 📁 Views
- 📁 Models  
- 📁 Services
- 📁 Resources
- 📁 Assets (ignórala)
- 📄 Otros archivos (ignóralos)

### 5.2 COPIAR CARPETA VIEWS

1. **En Finder**: Selecciona la carpeta **"Views"** completa
2. **Arrástrala** a Xcode, dentro de la carpeta azul "MusicaPalHector" (tu proyecto nuevo)
3. **En el diálogo que aparece, marca:**
   - ✅ Copy items if needed
   - ✅ Create groups  
   - ✅ Add to target: MusicaPalHector
4. **Click: Add**

### 5.3 COPIAR CARPETA MODELS

1. **En Finder**: Selecciona la carpeta **"Models"** completa
2. **Arrástrala** a Xcode, dentro de la carpeta azul "MusicaPalHector"
3. **Marca:** ✅ Copy items, ✅ Create groups, ✅ Add to target
4. **Click: Add**

### 5.4 COPIAR CARPETA SERVICES

1. **En Finder**: Selecciona la carpeta **"Services"** completa
2. **Arrástrala** a Xcode, dentro de la carpeta azul "MusicaPalHector"
3. **Marca:** ✅ Copy items, ✅ Create groups, ✅ Add to target
4. **Click: Add**

### 5.5 COPIAR ARCHIVOS MP3

```bash
# Abre Finder en la carpeta de canciones
open ~/Desktop/musica_ios/MusicaPalHector/MusicaPalHector/Resources/Songs
```

1. **En Finder**: Selecciona los 4 archivos MP3 (Cmd+Click para seleccionar múltiples):
   - EntregaTotal.mp3
   - CaifanesMiedo.mp3
   - UnHombreNormal.mp3
   - VicenteFernandezGema.mp3
2. **Arrástralos** a Xcode, dentro de la carpeta azul "MusicaPalHector"
3. **Marca:** ✅ Copy items, ✅ Add to target
4. **Click: Add**

## PASO 6: VERIFICAR ESTRUCTURA EN XCODE

**Tu proyecto en Xcode debe verse EXACTAMENTE así:**

```
📂 MusicaPalHector (carpeta azul)
  📄 MusicaPalHectorApp.swift
  📂 Views (nueva - debe tener fondo azul)
    📄 ContentView.swift
    📄 AllSongsView.swift
    📄 PlaylistsView.swift
    📄 LikedSongsView.swift
    📄 NowPlayingView.swift
    📄 MiniPlayerView.swift
    📄 SongRowView.swift
    📄 PlaylistDetailView.swift
    📄 PlaylistPickerView.swift
  📂 Models (nueva - debe tener fondo azul)
    📄 Song.swift
  📂 Services (nueva - debe tener fondo azul)
    📄 AudioManager.swift
    📄 DataManager.swift
  🎵 EntregaTotal.mp3 (archivo individual)
  🎵 CaifanesMiedo.mp3 (archivo individual)
  🎵 UnHombreNormal.mp3 (archivo individual)
  🎵 VicenteFernandezGema.mp3 (archivo individual)
  📂 Assets (ya estaba)
```

**SI NO SE VE ASÍ:** Vuelve al PASO 5 y arrastra las carpetas de nuevo.

## PASO 7: SELECCIONAR SIMULADOR DE IPHONE

1. **En la barra superior de Xcode**, busca donde dice "My Mac" o "MusicaPalHector › My Mac"
2. **Click ahí** y selecciona **iPhone 15 Pro** (o iPhone 14, iPhone 13, cualquier iPhone sirve)
3. **NO selecciones**: My Mac, Designed for iPad, Any iOS Device

## PASO 8: EJECUTAR LA APP

1. **Click en el botón ▶️** (triángulo grande arriba a la izquierda)
2. **Espera 3-5 minutos** (primera compilación es lenta)
3. **Se abre iPhone virtual** con la app instalada
4. **¡LISTO!** Ya tienes "Música Pal Héctor" funcionando

---

# 🔧 SI HAY ERRORES

## Error: "Failed to launch app in reasonable time"

```bash
# SOLUCIÓN RÁPIDA:
# En Xcode: Product → Clean Build Folder (Cmd+Shift+K)
```
1. Espera que termine
2. Cambia a **iPhone 14** (en vez de iPhone 15 Pro)
3. Dale ▶️ y espera **5 minutos completos**

```bash
# SOLUCIÓN COMPLETA (si no funciona la rápida):
killall Xcode
killall Simulator
xcrun simctl shutdown all
xcrun simctl erase all
sudo shutdown -r now
```

## Error: "Cannot find 'AudioManager'"
**Problema:** La carpeta Services no se copió correctamente
**Solución:** Vuelve al PASO 5.4 y arrastra la carpeta Services de nuevo

## Error: "Cannot find 'Song'"
**Problema:** La carpeta Models no se copió correctamente  
**Solución:** Vuelve al PASO 5.3 y arrastra la carpeta Models de nuevo

## Error: "Build input file cannot be found: ContentView.swift"
1. Click en proyecto (carpeta azul) → TARGETS → MusicaPalHector
2. Build Phases → Compile Sources
3. Busca ContentView.swift en rojo y elimínalo (tecla Delete)
4. La carpeta Views debería tener el ContentView.swift correcto

---

# 📱 USAR EL SIMULADOR

- **Click** = tocar pantalla del iPhone
- **Arrastrar** = hacer scroll
- **Cmd + Shift + H** = botón Home
- **Cmd + 1,2,3** = cambiar tamaño del simulador

---

# 🎯 RESUMEN DE RUTAS IMPORTANTES

**REPOSITORIO (archivos fuente):** `~/Desktop/musica_ios/MusicaPalHector/MusicaPalHector/`
- Views está en: `Views/`
- Models está en: `Models/`
- Services está en: `Services/`
- MP3s están en: `Resources/Songs/`

**TU PROYECTO NUEVO:** `~/Desktop/MiProyectoNuevo/`
- Aquí es donde trabajas en Xcode
- Aquí es donde arrastras los archivos

**COMANDOS PARA ABRIR CARPETAS:**
```bash
# Abrir repositorio con archivos fuente
open ~/Desktop/musica_ios/MusicaPalHector/MusicaPalHector

# Abrir carpeta de MP3s
open ~/Desktop/musica_ios/MusicaPalHector/MusicaPalHector/Resources/Songs

# Abrir tu proyecto nuevo
open ~/Desktop/MiProyectoNuevo/
```

**Tiempo total: 15-20 minutos**