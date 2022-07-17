//
//  TodoCell.swift
//  Todos
//
//  Created by mac on 2022/7/10.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBoxBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        checkBoxBtn.setImage(UIImage(systemName: "circle"), for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
