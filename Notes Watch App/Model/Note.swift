import Foundation

struct Note: Codable, Identifiable {
  let id: UUID
  let text: String
}
