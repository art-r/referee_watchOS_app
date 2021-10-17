//
//  ContentView.swift
//  handball referee companion WatchKit Extension
//  Used for counting goals
//
//  Created by personal on 17.10.21.
//

import SwiftUI

struct ContentView: View {
    @State private var homeGoals = 0
    @State private var guestGoals = 0
    
    func incrementHome() {
        homeGoals += 1
    }

    func decrementHome() {
        if (homeGoals > 0) {
            homeGoals -= 1

        }
    }
    
    func incrementGuest() {
        guestGoals += 1
    }
    
    func decrementGuest() {
        if (guestGoals > 0) {
            guestGoals -= 1
        }
        
    }
    func resetGoals() {
        homeGoals = 0
        guestGoals = 0
    }
    
    @State private var showingConfirm = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                Button("-1 H", action:decrementHome)
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
                
                Button("-1 G", action:decrementGuest)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .buttonStyle(.plain)
            }
            
        Spacer()
            
        Text("Home - Guest")
                .fontWeight(.bold)
        
        Text("\(homeGoals) - \(guestGoals)")
                .font(
                    .system(size: 40, weight: .bold, design: .rounded)
                )
            .bold()
            HStack {
                Button("Goal H", action:incrementHome)
                Button("Goal G", action:incrementGuest)
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
