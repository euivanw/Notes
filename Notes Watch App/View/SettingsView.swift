import SwiftUI

// MARK: - VIEW
struct SettingsView: View {
  // MARK: - PROPERTIES
  @AppStorage("lineCount") var lineCount: Int = 1
  @State private var value: Float = 1.0
  
  // MARK: - FUNCTIONS
  func update() {
    lineCount = Int(value)
  }
  
  // MARK: - BODY
  var body: some View {
    VStack(spacing: 8) {
      // Header
      HeaderView(title: "Settings")
      
      // Actual Live Count
      Text("Lines: \(lineCount)".uppercased())
        .fontWeight(.bold)
      
      // Slider
      Slider(value: Binding(get: {
        self.value
      }, set: {(newValue) in
        self.value = newValue
        self.update()
      }), in: 1...4, step: 1)
        .accentColor(.accentColor)
    } //: VStack
  } //: Body
}

// MARK: - PREVIEW
struct Settings_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}

// MARK: - END
