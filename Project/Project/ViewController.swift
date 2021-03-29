//
//  ViewController.swift
//  Project
//
//  Created by user193967 on 3/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func gettAllNotes() {
        do {
            let items = try context.fetch(NoteItem.fetchRequest())
        } catch {
            //error
        }
    }
    
    func createNote(price: Int32, vetName: String, title: String, content: String) {
        let newNote = NoteItem(context: context)
        newNote.price = price
        newNote.vetName = vetName
        newNote.title = title
        newNote.content = content
        newNote.date = Date()
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func deleteNote(note: NoteItem) {
        
        context.delete(note)
        
        do {
            try context.save()
        } catch {
            
        }
    }
}

