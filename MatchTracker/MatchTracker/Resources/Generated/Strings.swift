// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  internal enum Components {
    internal enum Views {
      internal enum MatchTeamsView {
        internal enum Versus {
          /// vs
          internal static let text = Localization.tr("Localizable", "Components.Views.MatchTeamsView.Versus.text", fallback: "vs")
        }
      }
      internal enum PlayerView {
        internal enum Name {
          /// Sem Nome
          internal static let text = Localization.tr("Localizable", "Components.Views.PlayerView.Name.text", fallback: "Sem Nome")
        }
        internal enum Nickname {
          /// Sem Apelido
          internal static let text = Localization.tr("Localizable", "Components.Views.PlayerView.Nickname.text", fallback: "Sem Apelido")
        }
      }
      internal enum TeamView {
        internal enum Name {
          /// Sem Nome
          internal static let placehoder = Localization.tr("Localizable", "Components.Views.TeamView.Name.placehoder", fallback: "Sem Nome")
        }
      }
    }
  }
  internal enum Features {
    internal enum Matches {
      /// Partidas
      internal static let navigationTitle = Localization.tr("Localizable", "Features.Matches.navigationTitle", fallback: "Partidas")
    }
  }
  internal enum Generic {
    internal enum Coder {
      /// Localizable.strings
      ///   MatchTracker
      internal static let fatalError = Localization.tr("Localizable", "Generic.Coder.FatalError", fallback: "init(coder:) has not been implemented")
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
