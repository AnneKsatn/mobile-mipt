//
//  ContentView.swift
//  Project
//
//  Created by user193967 on 3/28/21.
//

import SwiftUI

struct ContentView: View {
    
    var taskStore: TaskStore
    
    var body: some View {
        
 //       List(taskStore.tasks.indices) { index in
   //         Text(taskStore.tasks[index].name)
     //   }
        
        List(taskStore.tasks) {
            task in Text(task.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(taskStore: TaskStore())
        }
    }
}
