//
//  ContentView.swift
//  FamousBuilding
//
//  Created by Sofia Muladze on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var famousBuildings = ["Barcellona", "Londra", "Milano", "Mosca", "New York", "Parigi", "Pisa", "Rio de Janeiro"]
        .shuffled()//randomizza l'ordine dell'array per noi
    @State private var correctAnswer = Int.random(in: 0...2) //random
    
    @State private var showingScore = false//avviso
    @State private var scoreTitle = "" //mostra correct o wrong
    @State private var yourScore = 0//salva il punteggio
    @State private var scoreMessage = ""//messaggio punteggio
    
    
    var body: some View {
        
        ZStack {
            VStack (spacing: 20) {
                VStack {
                    Text("Dove si trova?")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .foregroundColor(.green)
                        .padding(20)
                    
                    Image(self.famousBuildings[correctAnswer])
                        .resizable()
                        .frame(width: 500, height: 380)
                }
                
                ForEach(0 ..< 3) { number in //crea un ciclo di 3
                    Button(action: {
                        self.buildingTapped(number)//number di ForEach viene passato alla funzione flagTapped
                        
                    }) {
                        HStack{
                            Text(famousBuildings[number])
                                .font(.system(size: 30))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                        .padding(20)
                                .background(Color (red: 0.00, green: 0.85, blue: 1.00))
                                .cornerRadius(17)
                        }
                    }
                }
                
                Text("\n\n\n\n\n\nIl Tuo Punteggio:  \(yourScore)")
                    .font(.system(size: 15))//dimensione font
                    .fontWeight(.light)//spessore font
                    .foregroundColor(.black)
            }
        }
        
        .alert(isPresented: $showingScore) {//avviso
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    func buildingTapped(_ number: Int) { //funzione che verifica la risposta
        if number == correctAnswer {
            scoreTitle = "Corretto"
            yourScore += 1
            scoreMessage = "Continua cosi!🥳 \(yourScore)"
        } else {
            scoreTitle = "Sbagliato"
            scoreMessage = "si trova a \(famousBuildings[correctAnswer])!🤭"
        }

        showingScore = true
    }
    func askQuestion() {
        famousBuildings.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// "Barcellona", "Londra", "Milano", "Mosca", "New York", "Parigi", "Pisa", "Rio de Janeiro"
