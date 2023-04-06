//
//  ImageCell.swift
//  miniBootcampChallenge
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func display(_ image: UIImage? = nil) {
        //If image exists, stop spinner and display the image. Else spinner keeps spinning.
        if let image = image {
            imageView.stopSpin()
            imageView.image = image
        }else {
            imageView.spin()
        }
    }
}

