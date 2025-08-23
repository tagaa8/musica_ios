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

**Si sigues estos pasos exactos, la app funcionará sin errores.**