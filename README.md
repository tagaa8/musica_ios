# Música Pal Héctor 🎵

Una aplicación de reproductor de música para iOS desarrollada con SwiftUI. La app incluye sus propias canciones integradas (no usa tu biblioteca musical), no requiere internet y todo se almacena localmente.

---

# 🚨 SI ESTÁS PERDIDO EN XCODE - LEE ESTO PRIMERO

## Tu proyecto se ve así (MAL) ❌:
```
📂 MusicaPalHector
  📄 MusicaPalHectorApp.swift
  📄 ContentView.swift (EN ROJO - ROTO)
  📂 Assets
```

## Necesitas que se vea así (BIEN) ✅:
```
📂 MusicaPalHector
  📄 MusicaPalHectorApp.swift
  📂 Views
    📄 ContentView.swift
    📄 AllSongsView.swift
    📄 PlaylistsView.swift
    📄 etc...
  📂 Models
    📄 Song.swift
  📂 Services
    📄 AudioManager.swift
    📄 DataManager.swift
  📂 Resources
    🎵 EntregaTotal.mp3
    🎵 CaifanesMiedo.mp3
    🎵 etc...
  📂 Assets
```

## 🔥 SOLUCIÓN RÁPIDA:

1. **ELIMINA** el ContentView.swift roto (click derecho → Delete)
2. **ARRASTRA** todas las carpetas del repositorio a Xcode
3. **Selecciona iPhone 15 Pro** (NO "My Mac")
4. **Dale PLAY** ▶️

---

## Características Principales

### 🎧 Reproductor de Música
- Controles completos: Play/Pause, Next, Previous
- Modo Shuffle (aleatorio)
- Modo Repeat (repetir canción o playlist)
- Visualizador de ondas de audio animado
- Control de volumen integrado
- Barra de progreso interactiva

### 📱 Interfaz de Usuario
- Diseño moderno con gradientes y efectos visuales
- Tema oscuro optimizado
- Animaciones fluidas y profesionales
- Mini reproductor flotante
- Vista de reproducción a pantalla completa

### 🎵 Gestión de Música
- **Todas las Canciones**: Vista completa de tu biblioteca
- **Me Gusta**: Canciones marcadas como favoritas
- **Playlists**: Crea y gestiona tus propias playlists
- **Top 25**: Playlist automática con las 25 canciones más escuchadas en los últimos 10 días
- Búsqueda integrada en todas las secciones

### 📊 Características Avanzadas
- Sistema de cola de reproducción
- Menú contextual para cada canción (añadir a cola, añadir a playlist, etc.)
- Historial de reproducción
- Estadísticas de reproducción por canción
- Almacenamiento local con UserDefaults

## Requisitos del Sistema

- **macOS**: 12.0 o superior (para desarrollo)
- **Xcode**: 14.0 o superior (descarga desde App Store - ~7GB)
- **iOS Simulator**: Se descarga automáticamente (~7GB adicionales)
- **iOS**: 16.0 o superior (para dispositivos físicos)
- **Espacio en disco**: ~20GB libres para Xcode y simuladores
- **Apple ID**: Gratuito (no necesitas cuenta de desarrollador de paga para probar)

## 🛠️ INSTALACIÓN PASO A PASO (Para principiantes en Xcode)

### 🚨 PROBLEMA COMÚN: Tu proyecto está vacío
Si tu Xcode se ve como la imagen que mandaste (solo 3 archivos), necesitas añadir TODOS los archivos del repositorio.

---

### Paso 0: Instalar Xcode (si es tu primera vez)

1. **Descarga Xcode desde App Store:**
   - Busca "Xcode" en App Store
   - Click en "Obtener" (es gratis)
   - La descarga es de ~7GB, puede tardar 30-60 minutos
   
2. **Primera apertura de Xcode:**
   - Abre Xcode por primera vez
   - Acepta los términos y condiciones
   - **IMPORTANTE**: Xcode pedirá instalar "Additional Components" - dale "Install"
   - Ingresa tu contraseña de Mac cuando lo pida
   - Espera 5-10 minutos a que termine

3. **Descarga del iOS Simulator:**
   - Es NORMAL que Xcode descargue el iOS Simulator (~7GB)
   - Aparecerá una ventana mostrando "iOS 18.1 Simulator" o similar
   - Esto es NECESARIO para probar la app sin un iPhone físico
   - Déjalo descargar completamente (puede tardar 20-40 minutos)

4. **Permisos de acceso a Documentos:**
   - Si Xcode pide acceso a tu carpeta de Documentos o Desktop, dale "Permitir"
   - Esto es necesario para abrir proyectos desde estas ubicaciones

### Paso 1: Clonar el Repositorio

```bash
# Abre Terminal (búscala en Spotlight con Cmd+Espacio)
# Navega a tu carpeta de proyectos (o crea una)
cd ~/Desktop
mkdir Proyectos
cd Proyectos

# Clona el repositorio
git clone git@github.com:tagaa8/musica_ios.git
cd musica_ios
```

### Paso 2: Abrir el Proyecto en Xcode

#### Opción A: Si el proyecto abre correctamente
```bash
# Abrir el proyecto en Xcode
open MusicaPalHector/MusicaPalHector.xcodeproj
```

#### Opción B: Crear el proyecto desde cero (RECOMENDADO para primera vez)

1. **Abre Xcode** (desde Applications o Launchpad)

2. **En la pantalla de bienvenida:**
   - Click en "Create New Project" (o File → New → Project)
   
3. **Selecciona el tipo de proyecto:**
   - Selecciona "iOS" en la parte superior
   - Selecciona "App" (el primer icono)
   - Click "Next"

4. **Configura el proyecto:**
   - **Product Name**: `MusicaPalHector`
   - **Team**: Selecciona tu Apple ID (si no aparece, ve al paso 3a abajo)
   - **Organization Identifier**: `com.tuNombre` (reemplaza tuNombre)
   - **Interface**: SwiftUI (IMPORTANTE)
   - **Language**: Swift
   - **Use Core Data**: Desmarcado ❌
   - **Include Tests**: Desmarcado ❌
   - Click "Next"

5. **Guarda el proyecto:**
   - Selecciona dónde guardar (ej: Desktop/Proyectos)
   - Click "Create"

### Paso 3: Configurar tu Apple ID (si no aparece en Team)

1. **En Xcode, ve a Settings:**
   - Xcode → Settings (o Preferences en versiones antiguas)
   - Click en "Accounts"
   - Click el botón "+" abajo a la izquierda
   - Selecciona "Apple ID"
   - Ingresa tu Apple ID y contraseña (el mismo de tu iPhone/iCloud)
   - Click "Next"

2. **Vuelve a tu proyecto:**
   - En "Team" ahora debería aparecer tu nombre
   - Selecciónalo

### 🔥 SOLUCIÓN DEFINITIVA: Añadir TODOS los archivos

## PASO 1: LIMPIAR EL PROYECTO ACTUAL

1. **Elimina el ContentView.swift roto:**
   - Click derecho en "ContentView.swift" (el que está en rojo)
   - **Delete → Move to Trash**

## PASO 2: AÑADIR TODOS LOS ARCHIVOS DEL REPO

1. **Abre Finder en paralelo:**
   - Nueva ventana de Finder
   - Ve a: `/Users/santiagojosemonterocastro/Desktop/Codigo Web/musica_ios`
   - Debes ver las carpetas: `Views`, `Models`, `Services`, `Resources`

2. **Arrastra TODA la carpeta Views:**
   - **Desde Finder → arrastra la carpeta "Views" completa a Xcode**
   - Ponla dentro de "MusicaPalHector" (carpeta azul)
   - **MARCA**: ✅ Copy items if needed
   - **MARCA**: ✅ Create groups
   - **MARCA**: ✅ Add to target: MusicaPalHector
   - **Click "Add"**

3. **Arrastra TODA la carpeta Models:**
   - **Desde Finder → arrastra la carpeta "Models" completa a Xcode**
   - Mismo proceso: ✅ Copy items, ✅ Create groups, ✅ Add to target

4. **Arrastra TODA la carpeta Services:**
   - **Desde Finder → arrastra la carpeta "Services" completa a Xcode**
   - Mismo proceso: ✅ Copy items, ✅ Create groups, ✅ Add to target

5. **Arrastra los 4 archivos MP3:**
   - Ve a la carpeta `Resources/Songs/` en Finder
   - **Selecciona los 4 archivos MP3** (Cmd+Click)
   - **Arrástralos a Xcode** (dentro de MusicaPalHector)
   - ✅ Copy items, ✅ Add to target

## PASO 3: VERIFICAR QUE ESTÁ TODO

Tu proyecto ahora debe verse así:
```
📂 MusicaPalHector
  📄 MusicaPalHectorApp.swift
  📂 Views (nueva)
    📄 ContentView.swift
    📄 AllSongsView.swift
    📄 PlaylistsView.swift
    📄 LikedSongsView.swift
    📄 NowPlayingView.swift
    📄 MiniPlayerView.swift
    📄 SongRowView.swift
    📄 PlaylistDetailView.swift
    📄 PlaylistPickerView.swift
  📂 Models (nueva)
    📄 Song.swift
  📂 Services (nueva)
    📄 AudioManager.swift
    📄 DataManager.swift
  🎵 EntregaTotal.mp3
  🎵 CaifanesMiedo.mp3
  🎵 UnHombreNormal.mp3
  🎵 VicenteFernandezGema.mp3
  📂 Assets
```

## 🚀 EJECUTAR LA APP (DESPUÉS DE AÑADIR TODOS LOS ARCHIVOS)

### ⚠️ IMPORTANTE: CAMBIAR DISPOSITIVO DE DESTINO

1. **CAMBIAR EL DISPOSITIVO DE DESTINO:**
   
   **ESTO ES LO QUE VES AHORA (MAL):**
   ```
   MusicaPalHector > My Mac (Designed for iPad) ❌
                     ^^^^^^^^^^^^^^^^^^^^^^^^
                     ESTE ES EL PROBLEMA
   ```
   
   **ESTO ES LO QUE NECESITAS (BIEN):**
   ```
   MusicaPalHector > iPhone 15 Pro ✅
                     ^^^^^^^^^^^^^^
                     UN IPHONE DE VERDAD
   ```

2. **CÓMO CAMBIARLO:**
   - **CLICK en donde dice "My Mac"** (está en la barra superior)
   - Se abre un menú desplegable
   - **BUSCA la sección "iOS Simulators"**
   - **SELECCIONA**: iPhone 15 Pro, iPhone 15, o cualquier iPhone
   - **NO selecciones**: My Mac, Designed for iPad, Any iOS Device

3. **SI NO APARECEN iPHONES EN LA LISTA:**
   - Ve a: **Xcode → Settings → Platforms**
   - Click en **"+"** → **iOS** → **Download**
   - Espera que descargue (20-40 minutos)
   - Reinicia Xcode
   - Ahora sí deberían aparecer los iPhones

## 🚀 CORRER LA APP (DESPUÉS DE SELECCIONAR UN IPHONE)

4. **DALE AL BOTÓN PLAY:**
   - **Opción A**: Click el botón ▶️ (triángulo grande arriba a la izquierda)
   - **Opción B**: Presiona `Cmd + R`

5. **LO QUE VA A PASAR:**
   - Dirá "Building..." (2-5 minutos la primera vez)
   - Se abre una ventana nueva con un iPhone virtual
   - La app se instala automáticamente en el iPhone simulado
   - Se abre "Música Pal Héctor"

## 🔴 SI HAY ERRORES (4 ERRORES MÁS COMUNES)

### Error 1: "Cannot find 'AudioManager'" 
**Problema**: No se copiaron las carpetas correctamente
**Solución**: 
1. Click derecho en carpeta azul "MusicaPalHector"
2. "Add Files to MusicaPalHector"
3. Selecciona carpeta "Services" del repo
4. ✅ "Copy items if needed"

### Error 2: "Cannot find 'Song'"
**Problema**: Falta el archivo Song.swift  
**Solución**: Añadir la carpeta "Models" igual que arriba

### Error 3: "No such module SwiftUI"
**Problema**: Target iOS incorrecto
**Solución**:
1. Click en proyecto (carpeta azul principal)
2. TARGETS → MusicaPalHector
3. Minimum Deployments → cambiar a iOS 16.0

### Error 4: "Build input file cannot be found: ContentView.swift"
**Problema**: Xcode busca un archivo ContentView.swift que no encuentra
**Solución**:
1. Click en proyecto (carpeta azul) → TARGETS → MusicaPalHector
2. Build Phases → Compile Sources
3. Busca ContentView.swift (aparece en rojo) y elimínalo
4. Arrastra Views/ContentView.swift del repo a Xcode
5. ✅ Copy items if needed + Target: MusicaPalHector

## ▶️ DALE PLAY Y LISTO

**Una vez que:**
- ✅ Tienes todas las carpetas (Views, Models, Services)  
- ✅ Tienes los 4 MP3
- ✅ Seleccionaste iPhone 15 Pro (NO My Mac)

**ENTONCES:**

1. **Click en el botón ▶️** (triángulo grande arriba a la izquierda)
2. **Espera 2-5 minutos** (primera compilación es lenta)
3. **Se abre el iPhone virtual** con tu app funcionando
4. **¡YA TIENES "MÚSICA PAL HÉCTOR" FUNCIONANDO!** 🎉

## 📱 CÓMO USAR EL SIMULADOR DE IPHONE

- **Click con el mouse** = tocar la pantalla del iPhone
- **Arrastrar** = hacer scroll
- **Cmd + Shift + H** = Botón Home del iPhone
- **Cmd + ←/→** = Rotar el iPhone
- **Cmd + 1,2,3** = Cambiar tamaño del simulador

### Paso 6: Usar la app en el Simulador

1. **Navegación básica:**
   - Click con el mouse simula tocar la pantalla
   - Arrastra para hacer scroll
   - Cmd + Shift + H = Botón Home
   - Cmd + ← o → = Rotar el dispositivo

2. **Probar la app:**
   - Las 4 canciones ya están incluidas
   - Toca cualquier canción para reproducirla
   - Usa los controles de reproducción
   - Crea playlists
   - Marca canciones como favoritas

## 🎵 Canciones Incluidas

La app ya incluye las siguientes canciones:
- **Entrega Total** - La Beriso
- **Miedo** - Caifanes
- **Un Hombre Normal** - Espinoza Paz  
- **Gema** - Vicente Fernández

Para añadir más canciones:
1. Copia los archivos MP3 a: `MusicaPalHector/MusicaPalHector/Resources/Songs/`
2. En Xcode, arrastra los archivos al proyecto
3. Asegúrate de que "Copy items if needed" esté marcado
4. Selecciona "MusicaPalHector" como target
5. Actualiza el archivo `DataManager.swift` con los nuevos títulos

## Para Instalar en tu iPhone Físico

### Requisitos:
- Cable USB para conectar tu iPhone
- iPhone con iOS 16 o superior
- Espacio disponible en el iPhone

### Pasos:

#### Preparación del Dispositivo:
1. Conecta tu iPhone a tu Mac con un cable USB
2. En tu iPhone, ve a `Ajustes > Privacidad y Seguridad > Modo Desarrollador` y actívalo
3. Reinicia tu iPhone cuando se te solicite

#### En Xcode:
1. Selecciona tu iPhone en el menú de dispositivos
2. La primera vez, Xcode preparará tu dispositivo para desarrollo
3. Presiona `Cmd + R` para compilar e instalar

#### En tu iPhone:
1. La primera vez, ve a `Ajustes > General > VPN y gestión de dispositivos`
2. Confía en tu certificado de desarrollador
3. Ahora puedes abrir la app

## ¿Es posible instalar apps sin App Store? ¡SÍ!

**Muchas personas creen que es imposible instalar una app en iPhone sin subirla a la App Store, pero esto NO es cierto.**

Apple permite oficialmente que los desarrolladores instalen y prueben sus propias apps en sus dispositivos mediante un proceso llamado **"sideloading"** o instalación directa. Este es el método que usan todos los desarrolladores para probar sus apps antes de publicarlas.

### 📱 Proceso Simple de Instalación:

1. **Conectar iPhone a Mac** con cable USB
2. **Abrir el proyecto en Xcode**
3. **Seleccionar tu iPhone** como dispositivo destino
4. **Dar click en Run** (▶️) para compilar e instalar
5. **Confiar en el certificado** en tu iPhone (Ajustes → General → VPN y gestión de dispositivos)

**¡Listo!** La app se instala y funciona como cualquier app descargada de la App Store.

### ✅ ¿Por qué funciona esto?

**Es completamente oficial y legal:**
- Apple DISEÑÓ este sistema para que los desarrolladores prueben sus apps
- Xcode viene con herramientas integradas para esto
- No estás "hackeando" o "jailbreaking" tu iPhone
- Es el mismo proceso que usan empresas como Netflix, Instagram, etc. para probar sus apps

**No necesitas ser un "desarrollador profesional":**
- Cualquier persona con un Apple ID puede hacerlo
- No necesitas conocimientos avanzados de programación
- Xcode maneja todo el proceso automáticamente
- Solo sigues unos pasos simples

### ⚠️ Importante sobre Seguridad:
- **NUNCA compartas tu Apple ID o contraseña**
- **Cada persona debe usar su propio Apple ID** para instalar la app
- **No compartas cuentas de desarrollador** - cada usuario debe firmar con su propia cuenta
- Esto es para **pruebas personales únicamente**
- La app funciona igual que cualquier app de la App Store

---

## Instalación GRATUITA (Sin Cuenta de Desarrollador)

### Opción 1: Instalación Personal Gratuita (7 días)
**Sin costo, pero con limitaciones**

1. **En tu Mac:**
   - Abre Xcode y el proyecto
   - En Signing & Capabilities, selecciona tu Apple ID personal (no necesitas cuenta de paga)
   - Xcode creará un certificado de desarrollo gratuito

2. **Conecta tu iPhone:**
   - Conecta con cable USB
   - Selecciona tu iPhone como destino
   - Presiona Run (Cmd+R)

3. **En tu iPhone:**
   - Ve a Ajustes > General > VPN y gestión de dispositivos
   - Confía en tu certificado de desarrollador
   - La app funcionará por 7 días

**Limitaciones:**
- ⏰ La app caduca cada 7 días (debes reinstalar)
- 📱 Máximo 3 dispositivos activos por Apple ID
- 🔄 Necesitas Xcode para reinstalar

### Opción 2: Sideloading con AltStore (Gratuito, más conveniente)
**Renovación automática cada 7 días**

1. **Instala AltServer en tu Mac:**
   - Descarga desde [altstore.io](https://altstore.io)
   - Instala y ejecuta AltServer

2. **Instala AltStore en tu iPhone:**
   - Conecta tu iPhone
   - Desde AltServer en Mac, selecciona "Install AltStore"

3. **Instala la app:**
   - Exporta el archivo .ipa desde Xcode
   - Abre AltStore en tu iPhone
   - Instala el .ipa

**Ventaja:** AltStore renueva automáticamente la app cuando estás en la misma red WiFi que tu Mac

## Distribución a Amigos (Con Cuenta de Desarrollador)

### Opción 1: TestFlight (Recomendado)
**Requisitos**: Cuenta de desarrollador de Apple ($99/año)

1. En Xcode, selecciona `Product > Archive`
2. Una vez completado, se abrirá el Organizer
3. Selecciona "Distribute App" > "App Store Connect"
4. Sube la build a App Store Connect
5. En App Store Connect, ve a TestFlight
6. Añade a tus amigos como testers externos (hasta 10,000 testers)
7. Ellos recibirán una invitación por email para descargar TestFlight
8. Podrán instalar la app desde TestFlight

### Opción 2: Ad Hoc Distribution
**Requisitos**: Cuenta de desarrollador de Apple

1. Necesitas los UDIDs de los dispositivos de tus amigos
2. Añádelos en tu cuenta de desarrollador
3. Crea un perfil de aprovisionamiento Ad Hoc
4. Archiva y exporta la app como Ad Hoc
5. Comparte el archivo .ipa
6. Tus amigos pueden instalarlo con iTunes o Apple Configurator

### Opción 3: Para Compartir con Amigos (Sin Cuenta de Desarrollador)

**Usando Sideloadly (Más fácil para tus amigos):**
1. Exporta el archivo .ipa desde Xcode
2. Tus amigos descargan [Sideloadly](https://sideloadly.io) en su computadora
3. Conectan su iPhone y arrastran el .ipa a Sideloadly
4. Inician sesión con su Apple ID personal
5. La app se instala (caduca en 7 días)

**Ventaja:** Tus amigos no necesitan Xcode ni conocimientos técnicos

## Estructura del Proyecto

```
MusicaPalHector/
├── Models/
│   └── Song.swift           # Modelos de datos
├── Views/
│   ├── ContentView.swift    # Vista principal
│   ├── AllSongsView.swift   # Lista de todas las canciones
│   ├── PlaylistsView.swift  # Gestión de playlists
│   ├── LikedSongsView.swift # Canciones favoritas
│   ├── NowPlayingView.swift # Reproductor a pantalla completa
│   └── MiniPlayerView.swift # Mini reproductor
├── Services/
│   ├── AudioManager.swift   # Gestión de reproducción
│   └── DataManager.swift    # Persistencia de datos
└── Resources/
    └── Songs/               # Carpeta para archivos MP3
```

## Añadir Más Canciones

### Paso 1: Preparar los archivos
- Nombra tus archivos MP3 sin espacios (ej: `MiCancion.mp3`)
- Cópialos a la carpeta `MusicaPalHector/MusicaPalHector/Resources/Songs/`

### Paso 2: En Xcode
1. Abre el proyecto en Xcode
2. Click derecho en la carpeta `Resources/Songs`
3. Selecciona "Add Files to MusicaPalHector..."
4. Selecciona los MP3 nuevos
5. ✅ Marca "Copy items if needed"
6. ✅ Marca "Add to targets: MusicaPalHector"

### Paso 3: Actualizar el código
Edita `DataManager.swift` en el método `loadSampleSongs()`:

```swift
songs = [
    // Canciones actuales
    Song(title: "Entrega Total", artist: "La Beriso", duration: 225, filePath: "EntregaTotal"),
    Song(title: "Miedo", artist: "Caifanes", duration: 240, filePath: "CaifanesMiedo"),
    Song(title: "Un Hombre Normal", artist: "Espinoza Paz", duration: 195, filePath: "UnHombreNormal"),
    Song(title: "Gema", artist: "Vicente Fernández", duration: 180, filePath: "VicenteFernandezGema"),
    // Añade las nuevas aquí (sin la extensión .mp3)
    Song(title: "Nueva Canción", artist: "Artista", duration: 200, filePath: "NombreArchivo"),
]
```

**Nota:** El `filePath` debe ser el nombre del archivo SIN la extensión `.mp3`

## Comandos Git Útiles

```bash
# Ver estado
git status

# Añadir cambios
git add .

# Hacer commit
git commit -m "Descripción de los cambios"

# Subir cambios
git push origin main

# Obtener cambios
git pull origin main
```

## Solución de Problemas Comunes (Primera vez con Xcode)

### Durante la instalación de Xcode:

**"Xcode requiere X GB adicionales"**
- Es normal, Xcode necesita ~15-20GB en total
- Libera espacio si es necesario

**"Instalando componentes adicionales"**
- Proceso normal, tarda 5-10 minutos
- Requiere contraseña de administrador

**"Descargando iOS Simulator"**
- TOTALMENTE NORMAL, es necesario
- El iOS 18.1 Simulator pesa ~7GB
- Sin esto no puedes probar la app

### Al abrir el proyecto:

**"El proyecto está dañado"**
- Sigue la Opción B: Crear proyecto desde cero
- Es un problema conocido de compatibilidad

**"Xcode no puede acceder a Documentos/Desktop"**
- Ve a Configuración del Sistema → Privacidad
- Dale permisos a Xcode para acceder a las carpetas

**"No such module SwiftUI"**
- Asegúrate de seleccionar iOS 16.0 o superior
- En proyecto → Deployment Target → 16.0

### Durante la compilación:

**"Cannot find 'AudioManager' in scope"**
- No copiaste la carpeta Services correctamente
- Vuelve a añadir la carpeta Services

**"Missing Info.plist"**
- Copia el Info.plist del repositorio
- Añádelo al proyecto

**"No team selected"**
- Ve a Paso 3: Configurar tu Apple ID
- Necesitas añadir tu Apple ID a Xcode

### En el simulador:

**"Las canciones no se reproducen"**
- Verifica que los MP3 estén añadidos al target
- En cada MP3 → Target Membership → ✅ MusicaPalHector

**"La app se ve muy grande/pequeña"**
- Cmd + 1, 2, o 3 para cambiar el tamaño del simulador
- Window → Physical Size para tamaño real

## Problemas Específicos

### La app no se instala en el iPhone
- Verifica que el Modo Desarrollador esté activado
- Confía en el certificado en Ajustes
- Asegúrate de que el iPhone esté desbloqueado durante la instalación

### No se reproducen las canciones
- Verifica que los archivos MP3 estén correctamente añadidos al target
- Comprueba que los nombres de archivo coincidan con los definidos en el código

### Error de certificados
- En Xcode, ve a Preferences > Accounts
- Añade tu Apple ID
- Descarga los certificados manualmente

## Características Futuras

- [ ] Soporte para más formatos de audio
- [ ] Ecualizador integrado
- [ ] Letras de canciones
- [ ] Widgets para la pantalla de inicio
- [ ] Sincronización con iCloud
- [ ] Modo CarPlay

## Contribuciones

Para contribuir al proyecto:
1. Haz fork del repositorio
2. Crea una rama para tu feature
3. Haz commit de tus cambios
4. Push a tu rama
5. Abre un Pull Request

## Licencia

Este proyecto es privado y para uso personal.

## Contacto

Para cualquier pregunta o problema, crea un issue en GitHub.

---

---

# 🚨 RESUMEN EJECUTIVO - SI ESTÁS PERDIDO

## TU PROBLEMA:
Tu Xcode solo tiene 3 archivos (MusicaPalHectorApp, ContentView roto, Assets) cuando debería tener como 20+ archivos.

## LA SOLUCIÓN:
1. **Elimina** el ContentView.swift roto
2. **Arrastra** desde Finder las carpetas: Views, Models, Services  
3. **Arrastra** los 4 archivos MP3
4. **Selecciona** iPhone 15 Pro (NO My Mac)
5. **Dale** al botón ▶️
6. **Espera** 2-5 minutos
7. **¡Funciona!** 🎉

## ESTRUCTURA CORRECTA:
```
📂 MusicaPalHector
  📄 MusicaPalHectorApp.swift
  📂 Views (9 archivos Swift)
  📂 Models (1 archivo Swift)  
  📂 Services (2 archivos Swift)
  🎵 4 archivos MP3
  📂 Assets
```

**Desarrollado con ❤️ para Héctor**