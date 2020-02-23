//
//  ServiceTypeCell.swift
//  Kaodim Test
//
//  Created by Ismail Sahak on 22/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import UIKit
import Foundation

final class ServiceTypeCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.contentMode = .scaleToFill
        icon.layer.cornerRadius = 6.0
        icon.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
