
//
//  ServiceTypeCell.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 22/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import UIKit
import Kingfisher

class ServiceTypeCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    
    func configure(serviceType: ServiceType) {
        labelName.text = serviceType.name
        
        let image = UIImage(named: "placeholder")
        if let url = serviceType.imageThumbUrl?.lg {
            if let imageUrl = URL(string: url) {
                serviceImage.kf.setImage(with: imageUrl, placeholder: image)
            }
        }
    }
}
