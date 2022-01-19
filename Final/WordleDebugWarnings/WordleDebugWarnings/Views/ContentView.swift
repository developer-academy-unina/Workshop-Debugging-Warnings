//
//  ContentView.swift
//  WordleDebugWarnings
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameModel: GameModel

    var body: some View {
        VStack {
            Text(gameModel.word)
                .font(.title)
                .frame(maxHeight: .infinity)
            KeyboardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let gameModel = GameModel()
    static var previews: some View {
        ContentView()
            .environmentObject(gameModel)
    }
}
