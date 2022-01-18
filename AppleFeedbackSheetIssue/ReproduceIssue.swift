import SwiftUI

@main
struct SmallApplication: App {
    var body: some Scene {

        WindowGroup {
            NavigationView {
                TabView {
                    TabbedView1()
                        .tabItem {
                            Label("Tab1", systemImage: "scanner")
                        }
                
                    TabbedView2()
                        .tabItem {
                            Label("Tab2", systemImage: "person")
                        }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct TabbedView1: View {
    var body: some View {
        Text("TabbedView1")
            .padding()
    }
}

struct TabbedView2: View {
    var body: some View {
        
        VStack{
            Text("TabbedView2")
            
            NavigationLink(
                "Go To View 3",
                destination: View3()
            ).isDetailLink(false)
        }
    }
}


struct View3: View {
    @State var presentSheet = false
    
    var body: some View {
        Button {
            presentSheet = true
        } label: {
            Text("Click me")
        }.sheet(isPresented: $presentSheet, onDismiss: nil) {
            View4()
        }
    }
}


struct View4: View {
    var body: some View {
        VStack {
            Text("Pull down the sheet and see the result")
        }
    }
}
