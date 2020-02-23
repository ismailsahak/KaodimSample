//
//  ServiceTypeHeader.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 23/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import UIKit

class ServiceTypeHeader: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    
    func configure(label: String) {
        labelText.text = label
    }
}
