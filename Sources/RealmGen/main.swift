import Foundation
import RealmGenKit

do {
    try Generator(arguments: CommandLine.arguments).execute()
} catch {
    print(error.localizedDescription)
    // TODO: Impl
}
