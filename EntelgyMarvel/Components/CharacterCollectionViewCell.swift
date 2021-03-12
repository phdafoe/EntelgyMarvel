//
//  CharacterCollectionViewCell.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import UIKit

protocol CharacterCollectionViewCellProtocol {
    func setupCell(data: ResultCharacter?)
}

class CharacterCollectionViewCell: UICollectionViewCell, ReuseIdentifierProtocol, CharacterCollectionViewCellProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var myImagePoster: UIImageView!
    @IBOutlet weak var myValueRent: UILabel!
    @IBOutlet weak var myCharacter: UILabel?
    
    var imageLoader = ImageLoader()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupCell(data: ResultCharacter?) {
        guard let dataDes = data else { return }
        self.myCharacter?.text = dataDes.name
        self.imageLoader.loadImage(whit: (dataDes.thumbnail?.pathURL)!)
        if self.imageLoader.image != nil {
            self.myImagePoster.image = self.imageLoader.image
        }
    }
}
