//
//  ContentView.swift
//  SanzoneSDK-Tests
//
//  Created by Gabriel Sanzone on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Items")) {
                    ForEach(items, id: \.self) { item in
                        Button(action: {
                            self.navigateToViewController(for: item)
                        }) {
                            Text(item)
                        }
                    }
                }
            }
            .navigationTitle("Lista de Itens")
        }
    }
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    func navigateToViewController(for item: String) {
        switch item {
        case "Item 1":
            // Chame a primeira ViewController aqui
            print("Chamar ViewController 1")
        case "Item 2":
            // Chame a segunda ViewController aqui
            print("Chamar ViewController 2")
        case "Item 3":
            // Chame a terceira ViewController aqui
            print("Chamar ViewController 3")
        case "Item 4":
            // Chame a quarta ViewController aqui
            print("Chamar ViewController 4")
        default:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
