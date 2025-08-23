# Música Pal Héctor 🎵

Reproductor de música para iOS con canciones incluidas. No requiere internet.

---

# 🚀 INSTALACIÓN SÚPER FÁCIL

## PASO 1: CLONAR EL REPOSITORIO
```bash
cd ~/Desktop
git clone git@github.com:tagaa8/musica_ios.git
cd musica_ios
```

## PASO 2: ABRIR EN XCODE
```bash
open MusicaPalHector/MusicaPalHector.xcodeproj
```

## PASO 3: SELECCIONAR SIMULADOR
En Xcode, arriba donde dice "My Mac", cámbialo a **iPhone 15 Pro**

## PASO 4: EJECUTAR
Dale click al botón **▶️** y listo!

---

# ✅ FLUJO SÚPER FÁCIL PARA CAMBIOS

Cuando yo haga cambios y los suba al repositorio:

```bash
cd ~/Desktop/musica_ios
git pull
```

Y ya. No necesitas recrear nada ni mover archivos. 

El proyecto YA está configurado correctamente en el repositorio.

---

# 🔧 SI HAY ERRORES

## "No ObservableObject of type AudioManager found"
```bash
# En Xcode: Product → Clean Build Folder (Cmd+Shift+K)
# Luego dale ▶️ de nuevo
```

## "Failed to launch app in reasonable time"
```bash
# Cambia a iPhone 14 en vez de iPhone 15 Pro
# Espera 5 minutos completos
```

## Si nada funciona:
```bash
killall Xcode
killall Simulator
xcrun simctl shutdown all
xcrun simctl erase all
```

---

**Tiempo total: 2 minutos**