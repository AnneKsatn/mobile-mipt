//
//  ViewController.swift
//  ThirdLab
//
//  Created by user187691 on 3/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var noteField: UITextView!
    
    var models: [String]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        table.delegate = self
        table.dataSource = self
        table.isHidden = true
        
        title = "Notes"
    }
    

    @IBAction func saveBtn(_ sender: UIButton) {
        if let text = noteField.text, !text.isEmpty {
            print(text)
            self.models.append(text)
            self.table.isHidden = false
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
}

