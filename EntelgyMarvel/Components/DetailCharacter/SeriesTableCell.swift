//
//  SeriesTableCell.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/03/2021.
//

import UIKit
import Kingfisher

protocol SeriesTableCellProtocol: class {
    func setInfo(data: ResultComic)
}


class SeriesTableCell: UITableViewCell, ReuseIdentifierProtocol, SeriesTableCellProtocol  {
    
    @IBOutlet weak var myImageComic: UIImageView!
    @IBOutlet weak var myLabelInfo: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myPrice: UILabel!
    
    @IBAction func myDetailACTION(_ sender: Any) {
    }
    
    @IBAction func myPurchaseACTION(_ sender: Any) {
    }
    
    @IBAction func myReaderACTION(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setInfo(data: ResultComic) {
        self.myLabelInfo.text = data.title
        self.myDescription.text = data.resultDescription
        //self.myDate.text = data.formatDate(date: data.modified!)
        let date = Date()
        self.myDate.text = date.string(with: data.modified ?? "n/a")
        if data.prices![0].price == 0.0 {
            self.myPrice.text = ""
        } else {
            self.myPrice.text = "\(data.prices![0].price ?? 0) €"
        }
        self.myImageComic.kf.setImage(with: ImageResource(downloadURL: (data.thumbnail?.pathURL)!),
                                       placeholder: UIImage(named: "placeholder"),
                                       options: [
                                        .scaleFactor(UIScreen.main.scale),
                                        .transition(.fade(1)),
                                        .cacheOriginalImage
                                       ],
                                       completionHandler: nil)
    }
    
}