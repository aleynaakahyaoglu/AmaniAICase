//
//  PersonCell.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import UIKit
import SDWebImage

class PersonCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    
    var person: Person? {
        didSet{
            title.text = person?.title
            desc.text = person?.desc
            if let url = person?.base64{
                image.sd_setImage(with: URL(string:url))
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
