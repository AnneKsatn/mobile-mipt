//
//  NoteCell.swift
//  Project
//
//  Created by user193967 on 3/29/21.
//

import UIKit

class NoteCell: UITableViewCell {
    

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
