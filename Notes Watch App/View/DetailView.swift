import SwiftUI

// MARK: - VIEW
struct DetailView: View {
  // MARK: - PROPERTIES
  let note: Note
  let count: Int
  let index: Int
  
  @State private var isCreditsPresented: Bool = false
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .center, spacing: 3) {
      // Header
      HeaderView()
      
      // Content
      Spacer()
      
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      } //: ScrollView
      
      Spacer()
      
      // Footer
      HStack(alignment: .center) {
        Image(systemName: "gear")
          .imageScale(.large)
          
        Spacer()
        
        Text("\(count) / \(index + 1)")
        
        Spacer()
        
        Image(systemName: "info.circle")
          .imageScale(.large)
          .onTapGesture {
            isCreditsPresented.toggle()
          }
          .sheet(isPresented: $isCreditsPresented, content: {
            CreditsView()
          })
      } //: HStack
      .foregroundColor(.secondary)
    } //: VStack
    .padding(3)
  } //: Body
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
  static var sampleData: Note = Note(id: UUID(), text: "Let's create an amazing watchOS app.")
  
  static var previews: some View {
    DetailView(
      note: sampleData,
      count: 5,
      index: 1
    )
  }
}

// MARK: - END
