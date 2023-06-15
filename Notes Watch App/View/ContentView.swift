import SwiftUI

// MARK: - VIEW
struct ContentView: View {
  // MARK: - PROPERTIES
  @State private var notes: [Note] = []
  @State private var text: String = ""
  
  // MARK: - FUNCTIONS
  func save() {
    dump(notes)
  }
  
  // MARK: - BODY
  var body: some View {
    NavigationStack {
      VStack {
        HStack(alignment: .center, spacing: 6) {
          TextField("Add New Note", text: $text)
          
          Button {
            guard text.isEmpty == false else { return }
            
            let note: Note = Note(id: UUID(), text: text)
            notes.append(note)
            
            text = ""
            
            save()
          } label: {
            Image(systemName: "plus.circle")
              .font(.system(size: 42, weight: .semibold))
          }
          .fixedSize()
          .buttonStyle(PlainButtonStyle())
          .foregroundColor(.accentColor)
        } //: HStack
        
        Spacer()
        
        Text("\(notes.count)")
      } //: VStack
      .navigationTitle("Notes")
    } //: NavigationStack
  } //: Body
}

// MARK: - PREVIEWS
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// MARK: - END
