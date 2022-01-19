//
//  GameModel.swift
//  WordleDebugWarnings
//
//  Created by Vasily Martin for the Developer Academy
//

import Foundation

class GameModel: ObservableObject {
    @Published var keyboard: Keyboard = load("keyboard-layout-en.json")
    @Published var word: String = ""

    func keyDown(key: KeyboardKey) {
        switch key.action {
        case .character:
            word += key.value
        case .backspace:
            if !word.isEmpty {
                word.removeLast()
            }
        case .enter:
            break
        }
    }

    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        guard
            let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
