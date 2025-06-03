//
//  BundleDecoder.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 03/06/2025.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            print("Failed to locate \(file) in bundle.")
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load \(file) from bundle.")
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            print("Failed to decode \(file) from bundle: \(error)")
            fatalError("Failed to decode \(file) from bundle.")
        }
    }
}


