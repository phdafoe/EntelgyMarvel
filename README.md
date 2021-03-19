# Openbank - Mobile Test

## Definición de una arquitectura
En este apartado implemento una arquitectura 'modelo-vista-presentador', la App de ejemplo es sencilla que le permite obtener desde un servicio web una lista de elementos, mostrarlas en una UITableView, además de enseñar una vista detalle del objeto seleccionado de dicha celda de la tabla, como parte del ejemplo, se utilizan tanto UItableView con UIcollectionView, y UITableViewCell como UICollectionViewCell personalizados.

### Estructura de la App
![Estructura proyecto](https://github.com/phdafoe/EntelgyMarvel/blob/main/EstructuraEjemplo.png)

### Base MVP del proyecto
Dicho patron define la **BaseViewController** para los UIViewController en general, un **BasePresenter** que establece con [GENERICOS](https://swiftbycoding.dev/swift/genericos/) tanto la **ViewController** como el **Router**, que define la forma de navegación de la App y el **BaseRouter** con las posibilidades de navegación necesarias para la App.
~~~
// MARK: - BaseNavigationController
class BaseNavigationController: UINavigationController {
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - BaseViewController
class BaseViewController <T>: UIViewController {
     var presenter: T?
}

// MARK: - BasePresenter
class BasePresenter <T, U> {
    
    internal var viewController: T?
    internal var router: U?
    
    convenience init (viewController: T, router: U? = nil) {
        self.init()
        self.viewController = viewController
        self.router = router
    }
    
}

// MARK: - BaseRouter
class BaseRouter<P> {
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func show(_ vc: UIViewController){
        if let navigationController = viewController?.navigationController {
            DispatchQueue.main.async {
                navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        if let navigationController = viewController?.navigationController {
            navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
            return
        }
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
~~~
## Especificaciones

### Uso de la Api de Marvel para la App
Se utiliza la Api de [Marvel](https://developer.marvel.com/documentation/getting_started) para realizar la App, en ella es necesario crear una cuenta para obtener la clave de Api pata poder realizar la llamadas necesarias, una vez que realizas el registro, y con las claves, se monta un StoreManager que se encargará de hacer las llamadas necesarias.

- ![Marvel1](https://github.com/phdafoe/EntelgyMarvel/blob/main/Marvel1.png)
- ![Marvel2](https://github.com/phdafoe/EntelgyMarvel/blob/main/Marvel2.png)

### Estructura del ServiceManager - StoreManager

- ![ServiceManager](https://github.com/phdafoe/EntelgyMarvel/blob/main/ServiceManager.png)
- ![StoreManager1](https://github.com/phdafoe/EntelgyMarvel/blob/main/StoreManager1.png)
- ![StoreManager2](https://github.com/phdafoe/EntelgyMarvel/blob/main/StoreManager2.png)

Se tiene en cuenta para realizar las llamadas la implementacion de [CryptoSwift](https://github.com/krzyzanowskim/CryptoSwift), para generar el respectivo hash, requisito de la Api

● Creatividad para resolver los requerimientos.
● Calidad del código entregado (estructura y buenas prácticas).
● Eficiencia de la solución entregada.
● Familiaridad con librerías, frameworks y plataformas de desarrollo.

## Descripción
Se solicita la creación de la estructura de una app que muestre un listado de los personajes Marvel y permite ver el detalle de cada uno de ellos de manera individual.


1. Se hace uso de la API de [Marvel](https://developer.marvel.com/docs)

3. Obtener el listado de personajes

## Funcionalidad
1. Listas el listado de personajes
2. Navegar al detalle de un personaje concreto

## Requisitos
● Requerido usar Xcode/Android Studio.
● Requerido utilizar Swift/Kotlin
● Se puede hacer uso de frameworks y librerías de terceros.
● Se valorará la implementación de tests.
● Se valorará un correcto control de errores.
● Total libertad para añadir cualquier funcionalidad extra que se considere.
