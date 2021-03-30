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
        
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        
        vc.title = "новые данные"
        navigationController?.pushViewController(vc, animated: true)
        
        vc.completion = {noteTitle, date in
            self.navigationController?.popToRootViewController(animated: true)
            
            print(date)
            self.createNote(title: noteTitle)
        }
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

