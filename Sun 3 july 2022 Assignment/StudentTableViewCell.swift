//
//  StudentTableViewCell.swift
//  Sun 3 july 2022 Assignment
//
//  Created by Prince's Mac on 03/07/22.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentRollNumberLabel: UILabel!
    @IBOutlet weak var studentCityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
