import SwiftUI

// MARK: - VIEW
struct ContentView: View {
  // MARK: - PROPERTIES
  @AppStorage("lineCount") var lineCount: Int = 1
  @State private var notes: [Note] = []
  @State private var text: String = ""
  
  // MARK: - FUNCTIONS
  private func save() {
    do {
      let data = try JSONEncoder().encode(notes)
      let url = getDocumentDirectory().appendingPathComponent("notes")
      try data.write(to: url)
    } catch {
      print("Saving data has failed.")
    }
  }
  
  private func load() {
    DispatchQueue.main.async {
      do {
        let url = getDocumentDirectory().appendingPathComponent("notes")
        let data = try Data(contentsOf: url)
        notes = try JSONDecoder().decode([Note].self, from: data)
      } catch {
        print("Loading data has failed.")
      }
    }
  }
  
  private func delete(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      save()
    }
  }
  
  private func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
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
        
        if notes.count >= 1 {
          List {
            ForEach(0..<notes.count, id:\.self) { i in
              NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                HStack {
                  Capsule()
                    .frame(width: 4)
                    .foregroundColor(.accentColor)
                  
                  Text(notes[i].text)
                    .lineLimit(lineCount)
                    .padding(.leading, 5)
                } //: HStack
              } //: NavigationLink
            } //: ForEach
            .onDelete(perform: delete)
          } //: List
        } else {
          Spacer()
          
          Image(systemName: "note.text")
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray)
            .opacity(0.25)
            .padding(25)
          
          Spacer()
        }
      } //: VStack
      .navigationTitle("Notes")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear(perform: {
        load()
      })
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
