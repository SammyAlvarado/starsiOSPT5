//
//  StarsController.swift
//  Starts iOSPT6
//
//  Created by Sammy Alvarado on 4/23/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import Foundation

class StarsController {
    
    init() {
        self.loadFromPersistentStore()
    }
    
    // Data set - 1 source of truth
    private(set) var stars: [Star] = []
    
    // CRUD Functions
    //Create
    @discardableResult func createStar(with name: String, distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        self.saveToPresistentStore()
        return star
    }
   
    
    // Mark: - Persistence Functions
    private var presistentFileURL: URL? {
        let fm = FileManager.default
        // We want to access teh documents directory in the user's domain
        guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask) .first else { return nil }
        // Create a new plist file in that directory
        return directory.appendingPathComponent("stars.plist")
    }
    
    
    // Save
    private func saveToPresistentStore() {
        guard let url = presistentFileURL else { return }
        
        // Turn Object into data
        // Write data to file
        
        // Stars Array6 ->
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
        
        
        
    }
    
    
    // Load
    private func loadFromPersistentStore () {
        let fm = FileManager.default
        guard let url = presistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        // plist file -> Data -> Stars
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            NSLog("Error loading stars data: \(error)")
        }
    }
    
    
}
