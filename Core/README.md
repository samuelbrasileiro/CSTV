## Core Module

The Core module provides essential functionalities and components for building robust and scalable applications.

### Author

The Core module is developed and documented by Samuel Brasileiro.

**GitHub Account: [https://github.com/samuelbrasileiro](https://github.com/samuelbrasileiro)**

---

## Flow

The Flow component in Core is responsible for managing the navigation and coordination of different screens or modules within an application.

### Coordinator

The `Coordinator` protocol defines the behavior of a coordinator.

#### Properties

- `navigationController`: The navigation controller associated with the coordinator.
- `parentCoordinator`: The parent coordinator.
- `childCoordinators`: The child coordinators.

#### Methods

- `init(resolver:navigationController:)`: Initializes the coordinator with a dependency resolver and a navigation controller.
- `start()`: Starts the coordinator.
- `removeCoordinator(_:)`: Removes a child coordinator.

#### Usage
```swift
let resolver = MyDependencyResolver()
let navigationController = UINavigationController()
let coordinator = MyCoordinator(resolver: resolver, navigationController: navigationController)
coordinator.start()
```

### Navigatable

The `Navigatable` protocol defines navigation behavior.

#### Associated Types

- `Route`: The type representing the navigation route.

#### Methods

- `navigate(to:)`: Navigates to the specified route.
- `goBack(animated:)`: Navigates back.

#### Usage
```swift
let route: MyRoute = ...
self.navigate(to: route)
self.goBack(animated: true)
```

### RouteProtocol

The `RouteProtocol` protocol defines the common properties and methods for defining navigation routes.

#### Properties

- `id`: A unique identifier for the route.

#### Methods

- `getTransitionStyle() -> NavigationTransitionStyle`: Returns the navigation transition style for the route.
- `getNavigationBarStyle() -> NavigationBarStyle`: Returns the navigation bar style for the route.

#### Usage
```swift
struct MyRoute: RouteProtocol {
    let id: String
    let transitionStyle: NavigationTransitionStyle
    let barStyle: NavigationBarStyle
}
```

#### NavigationTransitionStyle

The `NavigationTransitionStyle` enum represents different navigation transition styles.

##### Cases

| Case | Description |
|---|---|
| `push` | Represents a push navigation transition. |
| `presentModally` | Represents a modal presentation transition in a form sheet style. |
| `presentFullscreen` | Represents a modal presentation transition in a full-screen style. |

#### NavigationBarStyle

The `NavigationBarStyle` enum represents different navigation bar styles.

##### Cases

| Case | Description |
|---|---|
| `automatic` | The navigation bar style is set to automatic. |
| `normal` | The navigation bar style is set to normal. |
| `large` | The navigation bar style is set to large with prefersLargeTitles enabled. |

### Routable

The `Routable` protocol defines the behavior of an object that contains a route.

#### Associated Types

- `Route`: The type representing the route.

#### Methods

- `getTransition(to:)`: Returns the view controller associated with the specified route.

#### Usage
```swift
let route: MyRoute = ...
let viewController = getTransition(to: route)
```

### CoreSceneDelegate

The `CoreSceneDelegate` class is a base class for scene delegates.

#### Properties

- `window`: The window associated with the scene.
- `coordinator`: The coordinator associated with the scene.

#### Methods

- `scene(_:willConnectTo:options:)`: Called when the scene is about to connect to the session.
- `setupEnvironment()`: Sets up the environment to create flow.

#### Usage
```swift
public class MySceneDelegate: CoreSceneDelegate {
    public override func setupEnvironment() {
        let navigationController = UINavigationController()
        let resolver = MyDependecyResolver()
        let coordinator = MyCoordinator(resolver: resolver, navigationController: navigationController)
        coordinator.start()
        self.coordinator = coordinator
    }
}
```

---

## Domain

The Domain component in the Core Module encapsulates the core business logic and entities of the application.

### CoreImage

The `CoreImage` enum provides image assets used in the Core module.

#### Usage
```swift
let image = CoreImage.unavailableImage.image
```

#### Cases

| Case |Image |
|---|---|
| `unavailableImage` | <img src="Core/Resources/Assets.xcassets/Images/unavailable-image.imageset/imagem-indisponível.jpg" alt="UnavailableImage" width="100"> |

### CoreFont

The `CoreFont` enum provides font styles used in the Core module.

#### Usage
```swift
let boldFont = CoreFont.roboto.bold(size: 18)
```

#### Cases

| Case |Font |
|---|---|
| `roboto` | [Google Fonts](https://fonts.google.com/specimen/Roboto) |

### CoreColor

The `CoreColor` enum provides color styles used in the Core module.

#### Usage
```swift
let primaryBackgroundColor = CoreColor.primaryBackground.color
```

| Case |Color |
|---|---|
| `primary` | ![Primary Color](https://via.placeholder.com/40/FFFFFF) |
| `secondary` | ![Secondary Color](https://via.placeholder.com/40/6C6B7E) |
| `primaryBackground` | ![Primary Background Color](https://via.placeholder.com/40/161621) |
| `secondaryBackground`| ![Secondary Background Color](https://via.placeholder.com/40/272639) |


---

## Extensions

The Extensions component in the Core Module contains extensions for existing classes or structures, providing additional functionality.

### View+showError

The `View+showError` extension provides a convenient method to show an error alert on a view.

#### Usage
```swift
struct MyView: View {
    @State private var showErrorAlert = false
    @State private var errorMessage: Error?

    var body: some View {
        VStack {
            // Your view content here
        }
        .showError(errorMessage, isPresented: $showErrorAlert)
    }
}
```