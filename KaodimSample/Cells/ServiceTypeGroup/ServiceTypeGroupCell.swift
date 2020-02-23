//
//  ServiceTypeGroupCell.swift
//  Kaodim Test
//
//  Created by Ismail Sahak on 22/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import Foundation
import UIKit

class ServiceTypeGroupCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func setup(_ title: String) {
        self.label.text = title
        self.label.textColor = UIColor.darkGray
    }
}
