//
//  GuestFlag.swift
//  Notes
//
//  Created by Medhiko Biraja on 23/03/25.
//

import SwiftUI
struct GuestFlag: View {
    @State private var isAlertShown = false
    @State private var countries = ["Estonia", "France", "Germany", "Ireland","Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0..<3)
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showScore = false
    
    var body: some View {
        ZStack() {
            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack (spacing: 40){
                VStack {
                    Text("Tap the country of...")
                        .foregroundColor(Color.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(Color.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(.buttonBorder)
                            .shadow(radius: 4)
                    }
                }
                
            }
            .foregroundColor(.secondary)
            .padding(30)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Play again") {
                showScore.toggle()
                askQuestion()
            }
        } message: {
            Text("Your score: \(score)/\(countries.count)")
        }
        
        
                
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong!"
        }
        showScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }

}

#Preview {
    GuestFlag()
}
