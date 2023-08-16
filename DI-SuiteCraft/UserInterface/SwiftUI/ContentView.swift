//
//  ContentView.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                UIKitViewControllerWrapper()
                    .edgesIgnoringSafeArea(.all) // Adjust as needed
                NavigationLink(destination: StartView()) {
                    Text("Create an account")
                        .padding()
                }
                .padding(.bottom)
            }
        }
    }
}

struct StartView: View {
    var body: some View {
        Text("Start Screen")
            .navigationBarTitle("Start", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
