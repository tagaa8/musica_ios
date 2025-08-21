# Música Pal Héctor 🎵

Una aplicación de reproductor de música para iOS desarrollada con SwiftUI. La app incluye sus propias canciones integradas (no usa tu biblioteca musical), no requiere internet y todo se almacena localmente.

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
- **Xcode**: 14.0 o superior
- **iOS**: 16.0 o superior (para el dispositivo)
- **Cuenta de Desarrollador de Apple** (para instalar en dispositivos físicos)

## Instalación y Configuración

### 1. Clonar el Repositorio

```bash
# Clonar desde GitHub
git clone git@github.com:tagaa8/musica_ios.git
cd musica_ios
```

### 2. Abrir en Xcode

```bash
# Abrir el proyecto en Xcode
open MusicaPalHector/MusicaPalHector.xcodeproj
```

### 3. Configurar el Proyecto

1. Abre Xcode y selecciona el proyecto en el navegador
2. En la sección "Signing & Capabilities":
   - Selecciona tu Team (necesitas una cuenta de desarrollador)
   - El Bundle Identifier debe ser único (puedes cambiarlo si es necesario)
   - Xcode generará automáticamente los certificados necesarios

### 4. Las Canciones Incluidas

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

### 5. Ejecutar en el Simulador

1. Selecciona un simulador de iPhone en Xcode (ej: iPhone 15 Pro)
2. Presiona `Cmd + R` o el botón Play
3. La app se compilará y abrirá en el simulador

### 6. Instalar en tu iPhone (Desarrollo)

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

## Solución de Problemas

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

**Desarrollado con ❤️ para Héctor**