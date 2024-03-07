import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Content")
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        dismiss()
                    }
                }
            })
        }
    }
}

struct XMarkButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    ContentView()
}
