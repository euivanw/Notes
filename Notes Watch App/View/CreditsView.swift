import SwiftUI

// MARK: - VIEW
struct CreditsView: View {
  // MARK: - PROPERTIES
  @State private var randomNumber: Int = Int.random(in: 1..<4)
  
  private var randomImage: String {
    return "developer-no\(randomNumber)"
  }
  
  // MARK: - BODY
  var body: some View {
    VStack(spacing: 3) {
      // Profile Image
      Image(randomImage)
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      
      // Header
      HeaderView(title: "Credits")
      
      // Content
      Text("Ivan Wilhelm")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      
      Text("Developer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    } //: VStack
  } //: Body
}

// MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}

// MARK: - END
