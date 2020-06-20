//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Jeremy's Macbook Pro 16 on 6/19/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI


struct ContentView: View {
//    @State private var showingAlert = false
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    FlagImage(name: self.countries[number], handler: {
                        self.flagTapped(number)
                    })
//
//                    Button(action : {
//                        self.flagTapped(number)
//                    }) {
//                        Image(self.countries[number])
//                            .renderingMode(.original)
//                            .clipShape(Capsule())
//                            .overlay(Capsule().stroke(Color.black, lineWidth: 2))
//                            .shadow(color:.white, radius: 10)
//                    }
                }
                Text("\(scoreTitle)")
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                }
            )
        }
        
        
//        VStack(alignment: .trailing, spacing: 20) {
//            Text("Hello, World!")
//            Text("Jeremy Tandjung Hello")
//            HStack {
//                Text("Halah")
//                Text("Halah2")
//            }
//        }
//        ZStack{
//            Color.red
//               .frame(width: 200, height: 200)
//                // to ignore safe area constraints
//                .edgesIgnoringSafeArea(.all)
//            Text("Your Content")
//        }
        
//        VStack {
//            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//                .frame(width: 200, height: 200)
//            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//                .frame(width: 200, height: 200)
//            HStack{
//                Image(systemName: "pencil")
//                    .rotationEffect(Angle(degrees: 45))
//                Button(action: { print("Hello World") } ){
//                    Text("Tap Me")
//                }
//            }
//        }
        
//        Button("Show Alert") {
//            // set showingAlert to true
//            // SwiftUI automatically sets showingAlert back
//            // to false when dismissed
//            self.showingAlert = true
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
//        }
    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func printHello() {
        print("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
