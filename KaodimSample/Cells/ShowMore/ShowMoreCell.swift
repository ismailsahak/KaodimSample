//
//  ShowMoreCell.swift
//  Kaodim Test
//
//  Created by Ismail Sahak on 22/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import UIKit
import Foundation

class ShowMoreCell: UITableViewCell {
    
    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(dividerIsHidden: Bool) {
        divider.isHidden = dividerIsHidden
    }
}
