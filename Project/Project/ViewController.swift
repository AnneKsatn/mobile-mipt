//
//  ViewController.swift
//  Project
//
//  Created by user193967 on 3/29/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext

    
 /*  let tableView: UITableView = {
        let table = UITableView()
        
        table.register(UITableViewCell.self,
                        forCellReuseIdentifier: "cell")
        
        return table
    }()*/

    
    private var models = [NoteItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ветеринарные осмотры"
        
        gettAllNotes()
        
        let nib = UINib(nibName: "NoteCell", bundle: nil)
        tableView.register(nib,
                           forCellReuseIdentifier: "NoteCell")
        
        
        tableView.delegate = self
        tableView.dataSource = self
      /*  tableView.frame = view.bounds*/
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item",
                                      message: "Enter new item",
                                      preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                                        return
                                      }
                                        
            self?.createNote(price: 3000, vetName: "Suchova", title: text, content: "osmotr")
        }))
        
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell
        
        cell.price.text = String(model.price)
        cell.content.text = model.title
     //   priceCell.textLabel?.text = String(model.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let noteItem = models[indexPath.row]
            
            tableView.beginUpdates()
            deleteNote(note: noteItem)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func gettAllNotes() {
        do {
            models = try context.fetch(NoteItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
            gettAllNotes()
        } catch {
            
        }
    }
    
    func deleteNote(note: NoteItem) {
        
        context.delete(note)
        
        do {
            try context.save()
            gettAllNotes()
        } catch {
            
        }
    }
}

