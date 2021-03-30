

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    public var completion: ((String, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "сохранить",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))

    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty {
            completion?(text, datePicker.date)
        }
    }
}
