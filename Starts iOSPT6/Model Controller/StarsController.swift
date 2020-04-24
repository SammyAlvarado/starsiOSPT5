//
//  StarsController.swift
//  Starts iOSPT6
//
//  Created by Sammy Alvarado on 4/23/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import Foundation

class StarsController {
    // Data set - 1 source of truth
    private(set) var stars: [Star] = []
    
    // CRUD Functions
    //Create
    @discardableResult func createStar(with name: String, distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
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
    
    
    
    // Load
    
    
    
}
