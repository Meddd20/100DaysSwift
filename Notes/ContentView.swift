//
//  ContentView.swift
//  Notes
//
//  Created by Medhiko Biraja on 16/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = "";
    @State private var counting: Int = 0;
    let students = ["Medhiko", "Budi", "Surya"]
    @State private var selectedStudent: String = "Medhiko"
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    Text("hello world")
                }
                
                Button("Tap count \(counting)") {
                    counting+=1
                }
                TextField("hello", text: $name)
                    .keyboardType(.decimalPad)
                Text("my name is \(name)")
                
                Picker("select your student", selection: $selectedStudent){
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
                Text("my name is \(selectedStudent)")
                
            }
            .navigationTitle("Halo woi")
            .navigationBarTitleDisplayMode(.large)
        
            
        }
    }
}

#Preview {
    ContentView()
}
