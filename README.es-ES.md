

# SwiftYNAB

![Build Status](https://github.com/andrebocchini/swiftynab/actions/workflows/build.yml/badge.svg?branch=master)

SwiftYNAB es un framework de Swift para iOS/macOS/watchOS/tvOS/Linux para acceder a la [API](https://api.youneedabudget.com) de [You Need a Budget](https://www.youneedabudget.com). Actualmente, es compatible con todos los [endpoints](https://api.youneedabudget.com/v1) disponibles en la API.

Puedes consultar la documentación en línea [aquí](https://andrebocchini.github.io/swiftynab) para ver las características que ofrece este framework.

## Cómo usarlo

### Swift Package Manager

Las instrucciones sobre cómo agregar una dependencia de Swift Package a tu proyecto se pueden encontrar [aquí](https://developer.apple.com/documentation/xcode/swift-packages).

### Probarlo

#### Token de acceso a la API personal

El proyecto incluye una pequeña demostración para iOS que muestra cómo usar el framework. Si deseas probarla o si quieres escribir tu propio código, necesitarás un token de acceso personal a la API.

Asegúrate de ir aquí y obtener uno:

[https://api.youneedabudget.com/#personal-access-tokens](https://api.youneedabudget.com/#personal-access-tokens)

##### Código de ejemplo

Una vez que tengas tu token de acceso personal, puedes usarlo para probar el framework en tu aplicación. Comienza creando un nuevo proyecto y, en la parte superior del archivo donde planeas usar SwiftYNAB, agrega:

```swift
import SwiftYNAB
```

Luego, puedes probarlo escribiendo algo como:

```swift
let ynab = YNAB(accessToken: "TOKEN_GOES_HERE")

Task {
    do {
        let plans = try await ynab.plans.plans(includeAccounts: false)

        for plan in plans {
            print(plan.name)
        }
    } catch {
        print("Uh oh, something went wrong")
    }
}
```
 
 ## Contribuir

 Si deseas compilar y probar el código tú mismo, puedes clonar este repositorio y abrirlo directamente en Xcode. Desde allí, podrás editar el código fuente y ejecutar las pruebas.

 Para ejecutar la aplicación de demostración integrada, asegúrate de **no** tener el paquete SwiftYNAB abierto en Xcode, luego abre la aplicación de demostración en Xcode desde el directorio `demo`. Deberías poder ejecutarla en tu simulador y probarla.

  ### Recomendado

Para ejecutar los linters, generar la documentación y aprovechar los ganchos pre-commit, debes:

1. Instala [`mise`](https://mise.jdx.dev/getting-started.html)
2. Una vez que `mise` se haya instalado correctamente, ejecuta `mise install` para instalar todas las dependencias del proyecto
3. Ejecuta `mise run bootstrap` para configurar el proyecto para desarrollo
3. Ejecuta `mise run` para ver las tareas disponibles y preconfiguradas
