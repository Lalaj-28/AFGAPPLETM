# AFG APPLE TM

Aplicación nativa de iOS en Swift/SwiftUI para gestión de licencias y configuración ESP.

## Características

- **Pantalla Principal**: Fondo azul marino oscuro con tarjeta de información de licencia
- **License Information**: Muestra Key, UDID del dispositivo y fecha de expiración
- **Botón ENABLED**: Toggle visual (verde = TRUE, rojo = FALSE)
- **Botón OPTIONS**: Abre modal "ESP Settings" con múltiples switches y slider FOV
- **Persistencia**: Todos los ajustes se guardan automáticamente

## Instalación con TrollStore

1. Abre este proyecto en **Xcode**
2. Selecciona tu esquema de build (`Product > Scheme > AFGAPPLETM`)
3. Ve a `Product > Archive` para crear un archivo
4. En el Organizer, selecciona el archive y haz clic en **Distribute App**
5. Elige **Copy App** y guarda el `.app`
6. Convierte el `.app` a `.ipa`:
   ```bash
   mkdir Payload
   cp -R AFGAPPLETM.app Payload/
   zip -r AFGAPPLETM.ipa Payload
   rm -rf Payload
   ```
7. Transfiere el `.ipa` a tu iPhone
8. Abre **TrollStore** e instala el `.ipa`

## Bundle ID

`com.afgapple.tm`

## Requisitos

- iOS 18+
- Xcode 16+
- Swift 6

## Notas

- No requiere capacidades de pago (sin push, iCloud ni Apple Pay)
- Compatible con instalación permanente vía TrollStore
