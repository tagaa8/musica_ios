# Música Pal Héctor 🎵

Una aplicación de reproductor de música para iOS desarrollada con SwiftUI, inspirada en Spotify pero con almacenamiento local y sin necesidad de conexión a internet.

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

### 4. Añadir Canciones

Las canciones deben añadirse en formato `.mp3` en la carpeta:
```
MusicaPalHector/MusicaPalHector/Resources/Songs/
```

1. Arrastra los archivos MP3 a esta carpeta en Xcode
2. Asegúrate de que "Copy items if needed" esté marcado
3. Selecciona "MusicaPalHector" como target

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

## Distribución a Amigos (TestFlight)

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

### Opción 3: Instalación Directa (Limitado)
**Sin cuenta de desarrollador**: Solo 3 dispositivos, la app caduca en 7 días

1. Tus amigos necesitan Xcode instalado
2. Deben clonar el repositorio
3. Compilar e instalar directamente desde Xcode
4. La app dejará de funcionar después de 7 días

## Limitaciones sin Cuenta de Desarrollador

- **Máximo 3 dispositivos** registrados simultáneamente
- **La app caduca en 7 días** y debe reinstalarse
- **No puedes usar TestFlight**
- **No puedes distribuir archivos .ipa**
- Tus amigos necesitarían Xcode para instalar la app

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

1. Prepara tus archivos MP3
2. En Xcode, arrastra los archivos a `Resources/Songs`
3. Modifica `DataManager.swift` en el método `loadSampleSongs()` para incluir las nuevas canciones:

```swift
songs = [
    Song(title: "Nombre Canción", artist: "Artista", duration: 180, filePath: "archivo.mp3"),
    // Añade más canciones aquí
]
```

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