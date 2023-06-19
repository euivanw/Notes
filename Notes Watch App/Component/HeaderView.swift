import SwiftUI

// MARK: - VIEW
struct HeaderView: View {
  // MARK: - PROPERTIES
  var title: String = ""
  
  // MARK: - BODY
  var body: some View {
    VStack {
      // Title
      if !title.isEmpty {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      
      // Separator
      HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      } //: HStack
      .foregroundColor(.accentColor)
    } //: VStack
  } //: Body
}

// MARK: - PREVIEW
struct Header_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeaderView()
      HeaderView(title: "Header Title")
    }
  }
}

// MARK: - END
