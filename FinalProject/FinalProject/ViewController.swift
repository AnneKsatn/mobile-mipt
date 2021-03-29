//
//  ViewController.swift
//  FinalProject
//
//  Created by user193967 on 3/29/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext

    private var models = [NoteItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettAllNotes()
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Vet notes"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }
    
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item",
                                      message: "Enter new item",
                                      preferredStyle: .alert)
        
        alert.addTextField { (textField) in textField.text = "Вакцинация от сибирской язвы"}
        
        
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first,
                  let text = field.text,
            
                  !text.isEmpty else {
                                        return
                                      }
                                        
            self?.createNote(title: text)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.row].title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
    
        
        cell.detailTextLabel?.text = dateFormatter.string(from: models[indexPath.row].date! as Date)
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
    
    func createNote(title: String) {
        let newNote = NoteItem(context: context)

        newNote.title = title
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

