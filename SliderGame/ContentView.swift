//
//  ContentView.swift
//  SliderGame
//
//  Created by Алексей on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var aletrPresent = false
    @State private var currentValue: Double = 0
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к: ")
                Text(targetValue.formatted())
            }
            HStack {
                Text("0")
                SliderView(value: $currentValue)
                Text("100")
            }
            
            Button("Проверь меня!") {
                aletrPresent = true
            }
            .alert(Text("Your score \(computeScore())"), isPresented: $aletrPresent) {}
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
