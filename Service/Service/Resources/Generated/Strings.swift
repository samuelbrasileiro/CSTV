// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  internal enum Models {
    internal enum Error {
      internal enum DataNotDecoded {
        /// Data not decoded
        internal static let comment = Localization.tr("Localizable", "Models.Error.dataNotDecoded.comment", fallback: "Data not decoded")
        /// There was data, but it was not possible to decode it to the requested type
        internal static let title = Localization.tr("Localizable", "Models.Error.dataNotDecoded.title", fallback: "There was data, but it was not possible to decode it to the requested type")
      }
      internal enum DataNotFound {
        /// Data not found
        internal static let comment = Localization.tr("Localizable", "Models.Error.dataNotFound.comment", fallback: "Data not found")
        /// Localizable.strings
        ///   Service
        internal static let title = Localization.tr("Localizable", "Models.Error.dataNotFound.title", fallback: "There was no data to be fetched")
      }
      internal enum InvalidStatusCode {
        /// Invalid Status Code
        internal static let comment = Localization.tr("Localizable", "Models.Error.invalidStatusCode.comment", fallback: "Invalid Status Code")
        /// Unexpected status code. Expected 200
        internal static let title = Localization.tr("Localizable", "Models.Error.invalidStatusCode.title", fallback: "Unexpected status code. Expected 200")
      }
      internal enum InvalidURL {
        /// InvalidURL
        internal static let comment = Localization.tr("Localizable", "Models.Error.invalidURL.comment", fallback: "InvalidURL")
        /// The URL you tried to create, "%@", was invalid
        internal static func title(_ p1: Any) -> String {
          return Localization.tr("Localizable", "Models.Error.invalidURL.title", String(describing: p1), fallback: "The URL you tried to create, \"%@\", was invalid")
        }
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
