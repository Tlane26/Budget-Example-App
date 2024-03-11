//
//  StringExtension.swift
//  Budget SwiftData
//
//  Created by Tlanetzi Chavez Madero on 11/03/24.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
