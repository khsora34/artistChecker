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
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 10
        albumImage.layer.cornerRadius = 10
        albumImage.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
