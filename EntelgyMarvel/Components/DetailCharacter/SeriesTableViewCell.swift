//
//  SeriesTableViewCell.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/03/2021.
//

import UIKit

protocol SeriesTableViewCellProtoco: class {
    <#requirements#>
}


class SeriesTableViewCell: UITableViewCell, ReuseIdentifierProtocol, SeriesTableViewCellProtoco {
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(UINib(nibName: CharacterCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.defaultReuseIdentifier)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SeriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.myCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.defaultReuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        return cell
    }
}
