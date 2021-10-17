//
//  ContentView.swift
//  handball referee companion WatchKit Extension
//  Used for counting goals
//
//  Created by personal on 17.10.21.
//

import SwiftUI

struct ContentView: View {
    @State private var heimTore = 0
    @State private var gastTore = 0
    
    func incrementHeim() {
        heimTore += 1
    }

    func decrementHeim() {
        if (heimTore > 0) {
            heimTore -= 1

        }
    }
    
    func incrementGast() {
        gastTore += 1
    }
    
    func decrementGast() {
        if (gastTore > 0) {
            gastTore -= 1
        }
        
    }
    func resetGoals() {
        heimTore = 0
        gastTore = 0
    }
    
    @State private var showingConfirm = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                Button("-1 H", action:decrementHeim)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .buttonStyle(.plain)
                
                Button("RESET") {
                    showingConfirm = true
                }
                    .foregroundColor(.red)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .buttonStyle(.plain)
                    .confirmationDialog("Reset Goals?", isPresented: $showingConfirm, titleVisibility: .visible) {
                        Button("Yes", action:resetGoals)
                    }
                Button("-1 G", action:decrementGast)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .buttonStyle(.plain)
            }
            
        Spacer()
            
        Text("Heim - Gast")
                .fontWeight(.bold)
        
        Text("\(heimTore) - \(gastTore)")
                .font(
                    .system(size: 40, weight: .bold, design: .rounded)
                )
            .bold()
            HStack {
                Button("Tor H", action:incrementHeim)
                Button("Tor G", action:incrementGast)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
