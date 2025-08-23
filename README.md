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

## PASO 3: CREAR PROYECTO NUEVO EN XCODE

**El proyecto actual está corrupto, necesitas crear uno nuevo:**

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
   - **Include Tests**: NO ❌
   - Click: **Next**
   - **Guarda en**: `~/Desktop/Codigo Web/` (o donde prefieras)
   - Click: **Create**

## PASO 4: LIMPIAR PROYECTO NUEVO

1. **Elimina ContentView.swift** que viene por defecto:
   - Click derecho en "ContentView.swift" → Delete → Move to Trash

## PASO 5: AÑADIR TODOS LOS ARCHIVOS

1. **Abre Finder** con el repositorio clonado:
```bash
open ~/Desktop/musica_ios
```

2. **Arrastra carpeta "Views" completa** desde Finder a Xcode:
   - Ponla dentro de la carpeta azul "MusicaPalHector"
   - ✅ Copy items if needed
   - ✅ Create groups  
   - ✅ Add to target: MusicaPalHector
   - Click: **Add**

3. **Arrastra carpeta "Models" completa** desde Finder a Xcode:
   - Mismo proceso: ✅ Copy items, ✅ Create groups, ✅ Add to target

4. **Arrastra carpeta "Services" completa** desde Finder a Xcode:
   - Mismo proceso: ✅ Copy items, ✅ Create groups, ✅ Add to target

5. **Arrastra los 4 archivos MP3**:
   - Ve a `Resources/Songs/` en Finder
   - Selecciona los 4 MP3 (Cmd+Click)
   - Arrástralos a Xcode
   - ✅ Copy items, ✅ Add to target

## PASO 6: VERIFICAR ESTRUCTURA

Tu proyecto debe verse así en Xcode:
```
📂 MusicaPalHector
  📄 MusicaPalHectorApp.swift
  📂 Views
    📄 ContentView.swift
    📄 AllSongsView.swift
    📄 PlaylistsView.swift
    📄 LikedSongsView.swift
    📄 NowPlayingView.swift
    📄 MiniPlayerView.swift
    📄 SongRowView.swift
    📄 PlaylistDetailView.swift
    📄 PlaylistPickerView.swift
  📂 Models
    📄 Song.swift
  📂 Services
    📄 AudioManager.swift
    📄 DataManager.swift
  🎵 EntregaTotal.mp3
  🎵 CaifanesMiedo.mp3
  🎵 UnHombreNormal.mp3
  🎵 VicenteFernandezGema.mp3
  📂 Assets
```

## PASO 7: SELECCIONAR SIMULADOR DE IPHONE

1. **En la barra superior de Xcode**, busca donde dice "My Mac" o similar
2. **Click ahí** y selecciona **iPhone 15 Pro** (cualquier iPhone sirve)
3. **NO selecciones**: My Mac, Designed for iPad, Any iOS Device

## PASO 8: EJECUTAR LA APP

1. **Click en el botón ▶️** (triángulo grande arriba a la izquierda)
2. **Espera 2-5 minutos** (primera compilación es lenta)
3. **Se abre iPhone virtual** con la app instalada
4. **¡LISTO!** Ya tienes "Música Pal Héctor" funcionando

---

# 🔧 SI HAY ERRORES

## Error: "Cannot find 'AudioManager'"
```bash
# La carpeta Services no se añadió correctamente
# Vuelve al PASO 5 y arrastra la carpeta Services de nuevo
```

## Error: "Cannot find 'Song'"
```bash
# La carpeta Models no se añadió correctamente  
# Vuelve al PASO 5 y arrastra la carpeta Models de nuevo
```

## Error: "Build input file cannot be found: ContentView.swift"
1. Click en proyecto (carpeta azul) → TARGETS → MusicaPalHector
2. Build Phases → Compile Sources
3. Busca ContentView.swift en rojo y elimínalo (tecla Delete)
4. La carpeta Views debería tener el ContentView.swift correcto

## Error: "No such module SwiftUI"
1. Click en proyecto (carpeta azul)
2. TARGETS → MusicaPalHector
3. Minimum Deployments → iOS 16.0

---

# 📱 USAR EL SIMULADOR

- **Click** = tocar pantalla del iPhone
- **Arrastrar** = hacer scroll
- **Cmd + Shift + H** = botón Home
- **Cmd + 1,2,3** = cambiar tamaño del simulador

---

# 🎵 CANCIONES INCLUIDAS

- **Entrega Total** - La Beriso
- **Miedo** - Caifanes
- **Un Hombre Normal** - Espinoza Paz
- **Gema** - Vicente Fernández

---

# 📱 INSTALAR EN TU IPHONE FÍSICO

1. **Conecta tu iPhone** con cable USB
2. **En iPhone**: Ajustes → Privacidad → Modo Desarrollador → ON
3. **En Xcode**: Selecciona tu iPhone en vez del simulador
4. **Dale ▶️** (primera vez pedirá confiar en certificado)
5. **En iPhone**: Ajustes → General → VPN y gestión → Confiar en desarrollador

---

# 🎯 RESUMEN RÁPIDO

1. **Descargar Xcode** desde App Store
2. **Clonar repo**: `git clone git@github.com:tagaa8/musica_ios.git`
3. **Crear proyecto nuevo** en Xcode (SwiftUI)
4. **Arrastrar carpetas** Views, Models, Services y MP3s
5. **Seleccionar iPhone** simulador
6. **Dale Play** ▶️
7. **¡Funciona!** 🎉

**Tiempo total: ~15-20 minutos**