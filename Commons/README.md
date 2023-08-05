# Commons Package

The Commons package provides a collection of commonly used utility extensions and functions for iOS development. These utilities aim to simplify and enhance the development process by providing reusable code snippets.

### Author

The Commons package is developed and documented by Samuel Brasileiro.

**GitHub Account: [https://github.com/samuelbrasileiro](https://github.com/samuelbrasileiro)**

---

### Collection+safeSubscript

This extension adds a subscript to `Collection` that allows for safe access to elements based on an index. It returns the element at the specified index if it exists, or `nil` otherwise.

#### Usage

```swift
let element = collection[safe: index]
```

### Date+formattedDate

This extension adds a method to `Date` that formats the date into a human-readable string. It provides different formats depending on whether the date is today, tomorrow, or in the future.

#### Usage

```swift
let dateString = someDate.formattedDate()
```

### UIFont+swiftUIFont

This extension adds a property to `UIFont` that converts the font to a SwiftUI `Font`, allowing you to use it directly in SwiftUI views.

#### Usage

```swift
let swiftUIFont = font.swiftUIFont
```

### View+cornerRadius

This extension adds a method to `View` that applies a corner radius to specific corners of the view. It uses `RoundedCorner` shape to achieve this.

#### Usage

```swift
someView.cornerRadius(10, corners: .allCorners)
```