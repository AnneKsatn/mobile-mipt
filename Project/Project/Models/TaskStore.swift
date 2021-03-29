//
//  TaskStore.swift
//  Project
//
//  Created by user193967 on 3/28/21.
//

import Foundation


class TaskStore {
    var tasks = [
        "Code a Swift UI",
        "Go to the shop",
        "Watch tutorial",
        "Walk with my dog"
    ].map{ Task(name: $0) } // closure
}
