# CSTV

### Details

CSTV is an app of discovering CS: GO matches happening across several worldwide tournaments. You can visualize the schedule to watch your favorites teams and players.

### Author

The project is developed and documented by Samuel Brasileiro.

**GitHub Account: https://github.com/samuelbrasileiro**

---

## Summary
- [Running Locally](#running-locally)
    - [Setting up the environment](#setting-up-the-environment)
    - [Creating Project](#creating-project)
- [Packages](#packages)
    - [Commons Documentation](/Commons/README.md)
    - [Dependency Injection Documentation](/DependencyInjection/README.md)
- [Modules](#modules)
    - [Service Documentation](/Service/README.md)
    - [Core Documentation](/Core/README.md)
    - [MatchTracker Documentation](/MatchTracker/README.md)
- [Unit Tests](#unit-tests)
- [Visualizing Dependency Graph](#visualizing-dependency-graph)
- [Coding Patterns](#coding-patterns)
- [Optional Features Implemented](#optional-features-implemented)

---

## Running Locally

To run the project locally, follow the setup instructions below.

### Setting up the environment

Before running the project, you need to set up the necessary tools and dependencies.


1. Install the latest version of [XcodeGen](https://github.com/yonaskolb/XcodeGen) using Homebrew:
    ```bash
    brew instal xcodegen
    ```

2. Install the latest version of [SwiftGen](https://github.com/SwiftGen/SwiftGen) using Homebrew:
    ```bash
    brew instal swiftgen
    ```

### Creating Project

To create and run the project locally, perform the following steps:

1. Clone the project repository:
    ```bash
    git clone https://github.com/samuelbrasileiro/CSTV.git
    ```

2. Navigate to the project directory:
    ```bash
    cd CSTV
    ```

3. Generate the FuzeChallenge's xcodeproj using XcodeGen:
    ```bash
    make project
    ```

4. Open the generated xcodeproj file and build and run the project.

---

## Packages

The project uses some packages that provide different functionalities and features. Below are the descriptions of the packages:

1. **DependencyInjection**

    The `DependencyInjection` package is a custom implementation of a dependency injection framework for Swift. It provides a way to manage dependencies and promote modularity and testability in the project. The package includes components and protocols for defining and injecting dependencies in a decoupled manner.
    
    **[Read Documentation](DependencyInjection/README.md)**

2. **Commons**

    The `Commons` package provides reusable code snippets for iOS development. It includes common utility functions, extensions, and custom UI components that can be used across different modules of the project.
    
    **[Read Documentation](Commons/README.md)**

3. **SDWebImageSwiftUI**

    The **[SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)** package is a widely used library for efficiently downloading and caching remote images asynchronously. It provides an easy-to-use API for loading images from URLs and handling caching and placeholder images. Downloaded via SPM.
    
---

## Modules

The CSTV app project is organized into different modules, each serving a specific purpose and providing essential functionalities for the application. Below are the descriptions of the modules:

1. **Service**

    The Service module provides a set of components and protocols for performing network requests. It includes networking utilities, request builders, and response handlers to simplify the process of making API calls and handling responses.
    
    **[Read Documentation](Service/README.md)**
    
2. **Core**

    The `Core` module provides essential functionalities and components to create the main structures of the project. It includes common UI components, coordinators, and utility classes that facilitate the implementation of the project's flow and navigation.
    
    **[Read Documentation](Core/README.md)**
    
3. **MatchTracker**

    The `MatchTracker` is responsible for managing the CS-GO matches visualization functionality of the application. It includes views, view controllers, coordinators, providers, and network requests necessary for handling the tracker flow. The module focuses on presenting and managing the user interface components related to matches, such as displaying upcoming and current matches, its players, and other details.
    
    **[Read Documentation](Store/README.md)**

4. **ModuleIntegration**

    The `ModuleIntegration` module facilitates the integration of various modules within the application. It provides a centralized mechanism for coordinating the interactions between different modules, enabling seamless communication and data exchange. This module ensures proper integration and collaboration among different components of the application.
    
5. **Application**

    The `Application` module represents the main entry point of the application. It includes the app delegate, scene delegates, and other necessary configurations for initializing and setting up the application. This module acts as the glue that brings all other modules together and starts the application's execution.

---

## Unit Tests

The project includes various test suites to ensure the correctness and stability of the codebase. Below are the descriptions of the test suites:

1. **ServiceTests**
    
    The `ServiceTests` suite contains unit tests for the Service module. It includes test cases to validate the networking fetch component.
    
2. **MatchTrackerTests**
    
    The `MatchTrackerTests` suite contains unit tests for the MatchTracker module. It includes test cases to validate the views, data view models and data manipulation layers.
    
3. **Dependency** Injection
    
    The `DependencyInjectionTests` suite contains unit tests for the DependencyInjection module. It includes test cases to ensure the correct configuration and injection of dependencies in the project.


---

## Visualizing Dependency Graph

To visualize the dependency graph of the CSTV project locally, follow the steps below:

1. Run the following command to generate the dependency graph image:

    ```bash
    make graph
    ```

    **Note:** It's necessary to have [Graphviz](https://graphviz.org/) visualization software installed on your machine to generate the graph image. If you don't have Graphviz installed, run the following command to install it using Homebrew:

    ```bash
    brew instal graphviz
    ```
2. After running the command, the dependency graph image will be generated and displayed.

    ![Dependency Graph Image](/public/images/dependency_graph.png "Dependency Graph Image")

---

## Coding Patterns

1. Modularity
    
    The project is developed with a modular approach, where each module has a clearly defined responsibility and is independent from others. This allows for proper separation of functionalities and better code organization.

2. **Architecture**

    CSTV follows an **MVVM (Model-View-ViewModel)** based architecture. The MVVM architecture is an approach that separates the presentation logic from the user interface, facilitating code testability, reusability, and maintainability. In this architecture, the Model layer represents the data and business rules, the View layer is responsible for displaying the user interface, and the ViewModel layer acts as a bridge between the data and the user interface.

3. **Project Generation**

    **XcodeGen** is the tool used in the project to generate the .xcodeproj file from a YAML configuration file. It simplifies the project configuration process by automating the creation of targets, schemes, and other Xcode-related settings, making continuous collaboration easier. 

4. **Resources Generation**
   
   **SwiftGen** is a tool used in the project to generate typed Swift code for resources such as images, strings, fonts, and colors. It analyzes the project's resource files and generates a series of enums and extensions that facilitate safe and typo-free access to resources.

5. **Protocol Oriented Programming**

    The project utilizes the **Protocol-Oriented Programming** code pattern. POP allows for the creation of more generic, reusable, and flexible code by promoting code composition and modularity.

6. **Use Cases**
   
    Use cases (providers) are used to decouple the usage rules from the View Models, achieving a more flexible architecture.

7. **Clean Code**

    CSTV is developed based on the principles of **Clean Code**, which emphasize the readability, simplicity, and maintainability of the code. The code have atomic and cohesive functions and classes, descriptive names for variables and methods, avoiding duplication, and maintaining an easily understandable structure.

## Optional Features Implemented

- **MVVM Architecture**: The app is designed using the MVVM architectural pattern, separating the responsibilities of the Model, View, and ViewModel layers for better testability and maintainability.

- **Unit Tests**: The project includes unit test suites covering the Service, MatchTracker, and DependencyInjection modules to ensure the correctness and stability of the codebase.

- **Responsive UI**: The UI follows the design spec from Figma and adapts to different screen sizes and orientations.

- **Pull-to-refresh**: All screens have a pull-to-refresh feature that allows users to reload its data.

- **Reactive Programming**: The SwiftUI views uses components from Combine framework, such as `@Published` objects, async and await calls enabling reactive programming.