//
//  AlbumTableViewCell.swift
//  ConsultaAutor
//
//  Created by Quico on 24/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreAlbum: UILabel!
    @IBOutlet weak var añoAlbum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
