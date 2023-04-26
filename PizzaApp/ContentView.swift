//
//  ContentView.swift
//  PizzaApp
//
//  Created by Alex on 2023-04-25.
//

import SwiftUI

//struct WeatherView: View {
//    var temp: String
//    var body: some View {
//        VStack (spacing: 20){
//
//            Text("Cupertino")
//                .font(.system(size: 24))
//            Text("\(temp)˚")
//                .font(.system(size: 60))
//            Text("Partly Cloudy")
//            HStack {
//                Text("H: 85˚")
//                Text("L: 55˚")
//            }
//        }.foregroundColor(.white)
//    }
//}

struct PlayButton: View {
  // Creates a binding to the var in ContentView (below)
  @Binding var isPlaying: Bool
  var body: some View {
    Button(action: {
      self.isPlaying.toggle()
    }) {
      Image(systemName: isPlaying ? "pause.circle" : "play.circle")
    }
  }
}

enum PizzaSize: String, CaseIterable, Identifiable {
    case eight, twelve, twenty
    var id: Self {self}
}

struct ContentView: View {
    @State var name = ""
    @State var address = ""
//    @State var selectedSize = Picker
    @State var pickup = false
    @State var delivery = 0
    @State var isVegetarian = 0
    @State var selectedSize: PizzaSize = .twelve
    
  var body: some View {
    Form{
        Section{
            TextField("Name", text: $name)
            TextField("Address", text: $address)
            if name != "" && address != ""{
                Text("n: \(name) & a: \(address)")
            } else if address != "" {
                Text("a: \(address)")
            } else if name != "" {
                Text("n: \(name)")
            } else {
                Text("n: Name & a: Address")
                    .foregroundColor(.gray)
            }
        }
        Section{
            Text("Pick up or delivery")
            Picker("Pick up or Delivery", selection: $delivery) {
                Text("Delivery").tag(0)
                Text("Pick Up").tag(1)
            }
            .pickerStyle(.segmented)
        }
        Section{
            Picker("Pizza Size", selection: $selectedSize, content: {
                Text("8\"").tag(PizzaSize.eight)
                Text("12\"").tag(PizzaSize.twelve)
                Text("20\"").tag(PizzaSize.twenty)
            })
            Text("Choose Meat Lovers or Vegetarian")
            Picker("Vegetarian Pizza?", selection: $isVegetarian) {
                Text("Meat lovers").tag(0)
                Text("Vegetarian").tag(1)
            }
            .pickerStyle(.segmented)
            
        }
        Section{
            // Display the name
            Text("\(name) ordered")
            // Display selectedSize need to use the rawValue
            Text("A \(selectedSize.rawValue) inch")
            // Display isVegetarian, use a ternary
            Text(isVegetarian != 0
            ? "Vegetarian Pizza"
            : "Meat Lovers Pizza")
            //
            if delivery == 0 {
                Text("You've chosen Delivery at \(address)")
            } else {
                Text("You've Chosen to Pick Up")
            }
        }
        Button {
            
        } label: {
            Text("I'm A Button, To Order Pizza!")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
    }
  }
}

//
//struct ContentView: View {
//    @State var dogs = ""
//    var body: some View {
//        ZStack{
//            Image("weather-bg")
//                .aspectRatio(contentMode: .fill)
//                .frame(alignment: .topLeading)
//
//            WeatherView(temp: "72")
            
                //
                //            Text("Stay Safe")
                //                .font(.largeTitle)
                //                .fontWeight(.medium)
                //                .foregroundColor(Color.black)
                //                .multilineTextAlignment(.center)
                //            HStack{
                //                VStack {
                //                    Image("washhands")
                //                    Text("wash hands frequently")
                //                }
                //                VStack(spacing: 10) {
                //                    Image("washhands")
                //                    Text("waer a facemask")
                //
                //                }
                //            }
                //            VStack(spacing: 20){
                //                Text("Hello World")
                //                Text("Hello World")
                //                Text("Hello World")
                //            }
                //            VStack(spacing:30){
                //                HStack(spacing:30){
                //                    Text("👩🏻‍💻")
                //                    Text("👩🏾‍💻")
                //                    Text("👨🏽‍💻")
                //                    Text("👨🏻‍💻") }
                //                HStack(spacing:30){
                //                    Text("👩🏻‍💻")
                //                    Text("👩🏾‍💻")
                //                    Text("👨🏽‍💻")
                //                    Text("👨🏻‍💻")
                //                }
                //            }
                //                .background(.orange)
                //                .padding(20)
                //            Image(systemName: "globe")
                //                .imageScale(.large)
                //                .foregroundColor(.accentColor)
                //            Text("Hello, hehe!")
                //
                //            VStack {
                //            TextField("Dogs", text: $dogs)
                //                    .background(.yellow)
                //            Divider()
                //            Text(dogs)
                //                    .background(.red)
                //            }
        
//
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
