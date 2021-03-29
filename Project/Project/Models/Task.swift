//
//  Task.swift
//  Project
//
//  Created by user193967 on 3/28/21.
//

import Foundation


struct Task: Identifiable {
    
    let id = UUID()
    
    var name: String
    var completed = false
}
