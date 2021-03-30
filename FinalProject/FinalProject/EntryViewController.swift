//
//  EntryViewController.swift
//  FinalProject
//
//  Created by user193967 on 3/30/21.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    public var completion: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty {
            completion?(text)
        }
    }
}
