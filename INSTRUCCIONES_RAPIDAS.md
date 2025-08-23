# 🚨 GUÍA RÁPIDA - CÓMO CORRER LA APP EN EL SIMULADOR DE IPHONE

## 🎯 PASO 1: SELECCIONAR EL SIMULADOR DE IPHONE (NO "My Mac")

### Dónde está:
En la barra superior de Xcode, verás algo como:
```
MusicaPalHector > My Mac (Designed for iPad)
                  ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
                  ESTE ES EL PROBLEMA - HAZ CLICK AQUÍ
```

### Qué hacer:
1. **CLICK en "My Mac" (o lo que diga ahí)**
2. Te aparecerá un menú desplegable
3. **BUSCA LA SECCIÓN "iOS Simulators"**
4. Selecciona cualquiera de estos:
   - iPhone 15 Pro ✅ (RECOMENDADO)
   - iPhone 15 ✅
   - iPhone 14 ✅
   - Cualquier iPhone ✅

### Si NO aparecen iPhones:
1. Ve al menú: **Xcode → Settings → Platforms**
2. Click en el botón **"+"**
3. Selecciona **iOS**
4. Descarga el simulador (puede tardar 20-40 min)

## 🔴 PASO 2: VER Y ENTENDER LOS ERRORES

### Dónde ver los errores:
- **Panel izquierdo**: Click en el ícono ⚠️ (triángulo con exclamación)
- **O simplemente**: Los errores aparecen con líneas rojas en el código

### Los 4 errores más comunes y sus soluciones:

#### Error 1: "Cannot find type 'AudioManager' in scope"
**SOLUCIÓN**: No se añadieron los archivos correctamente
```
1. Click derecho en la carpeta azul "MusicaPalHector"
2. Add Files to "MusicaPalHector"
3. Navega a donde clonaste el repo
4. Selecciona las carpetas: Services, Models, Views
5. ✅ Copy items if needed
6. ✅ Create groups
7. Add
```

#### Error 2: "No such module 'SwiftUI'"
**SOLUCIÓN**: Target iOS incorrecto
```
1. Click en el proyecto (carpeta azul principal)
2. En TARGETS → MusicaPalHector
3. Minimum Deployments → iOS 16.0
```

#### Error 3: "Cannot find 'Song' in scope"
**SOLUCIÓN**: Falta el archivo Song.swift
```
1. Busca en el repo clonado: Models/Song.swift
2. Arrástralo a Xcode dentro de una carpeta Models
3. ✅ Copy items if needed
```

#### Error 4: "ContentView appears twice"
**SOLUCIÓN**: Hay dos ContentView.swift
```
1. Elimina el ContentView.swift que NO está en Views
2. Click derecho → Delete → Move to Trash
```

## ⚡ PASO 3: CORRER LA APP (FINALMENTE!)

### Una vez que:
- ✅ Seleccionaste un iPhone en el simulador (NO "My Mac")
- ✅ No hay errores rojos

### DALE AL PLAY:
1. **Opción A**: Click el botón ▶️ (triángulo grande arriba a la izquierda)
2. **Opción B**: Presiona `Cmd + R`

### Qué va a pasar:
1. Dirá "Building MusicaPalHector..." (2-5 minutos la primera vez)
2. Se abrirá una ventana con un iPhone virtual
3. La app se instalará y abrirá automáticamente

## 🆘 SI TODAVÍA NO FUNCIONA

### Opción Nuclear - Crear proyecto desde cero:

1. **File → New → Project**
2. **iOS → App → Next**
3. Configura:
   - Product Name: `MusicaPalHector`
   - Team: Tu Apple ID (o "None" por ahora)
   - Interface: **SwiftUI** ← IMPORTANTE
   - Language: **Swift**
4. **Create**

5. **Ahora copia TODO del repo:**
   - Elimina el ContentView.swift que viene
   - Arrastra TODAS las carpetas (Views, Models, Services, Resources)
   - Arrastra los 4 MP3
   - ✅ Copy items if needed para TODO

6. **Selecciona iPhone 15 Pro** (NO "My Mac")
7. **Dale PLAY** ▶️

## 🎮 ATAJOS ÚTILES EN EL SIMULADOR

- **Cmd + Shift + H** = Botón Home
- **Cmd + D** = Sacudir el dispositivo
- **Cmd + K** = Mostrar/Ocultar teclado
- **Cmd + ←/→** = Rotar dispositivo
- **Device → Erase All Content** = Resetear si algo se rompe

## 📱 CAMBIAR TAMAÑO DEL SIMULADOR

Si el iPhone virtual es muy grande:
- **Window → Physical Size** (tamaño real)
- **Cmd + 1** (100%)
- **Cmd + 2** (75%)
- **Cmd + 3** (50%)
- **Cmd + 4** (33%)
- **Cmd + 5** (25%)

---

# 🚨 RESUMEN: LO QUE TENÉS QUE HACER YA

1. **CAMBIAR "My Mac" → iPhone 15 Pro**
2. **Si hay errores rojos → Añadir las carpetas que faltan**
3. **Dale al PLAY ▶️**
4. **Esperar que compile (2-5 min)**
5. **¡Listo! Ya tenés tu iPhone virtual con la app**

---

**NOTA**: My Mac, Designed for iPad, y Any iOS Device NO SON SIMULADORES DE IPHONE. Necesitas seleccionar específicamente un modelo de iPhone de la lista.