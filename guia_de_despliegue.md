# Guía de Despliegue - Aplicación T4_1

## Android
### Pasos de Despliegue:
1. **Generar keystore** - Firma digital para autenticar la app
2. **Configurar build.gradle** - Define versiones SDK y firma el release
3. **Build appbundle** - Crear paquete para Play Store con el comando bash `flutter build appbundle --release`
4. **Crear cuenta Google Play Console** - Portal recomendado por Google para publicar
5. **Subir AAB a Play Console** - Publicar en el portal oficial
6. **Completar metadatos** - Descripción, imágenes, categoría y versionado que necesitará Google
7. **Enviar para revisión** - Validación por parte de Google

---

## iOS
### Pasos de Despliegue:
1. **Tener Mac físico** - Requisito obligatorio de Apple
2. **Cuenta Apple Developer** - Necesitaremos las herramientas de publicación
3. **Actualizar Bundle Identifier** - ID único de la aplicación
4. **Archivar proyecto** - Generar IPA mediante Xcode con el comando bash `flutter build ipa --release`
5. **Validar en App Store Connect** - Revisar errores antes de subir
6. **Subir a TestFlight** - Beta testing (opcional)
7. **Enviar a App Store** - Revisión por parte de Apple

---

## Windows
### Pasos de Despliegue:
1. **Habilitar soporte Windows** - En la terminal de la máquina: `flutter config --enable-windows-desktop` (cambiar `windows` por `linux` o `macos` si lo necesitamos)
2. **flutter build windows** - Generar ejecutable .exe con el comando bash `flutter build windows --release` (cambiar `windows` por `linux` o `macos` si lo necesitamos)
3. **Pruebas en Windows** - Verificar funcionamiento local
4. **Empaquetar con MSIX** - Formato moderno de instalación
5. **Firmar paquete** - Certificado digital (opcional pero recomendado)
6. **Distribución** - Microsoft Store o instalador directo

---
