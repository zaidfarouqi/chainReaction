//
//  mapTableViewCell.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import UIKit

class mapTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addShadowAndCornerRadius(shadowOpacity: 0.1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initView(img:String,author:String,authourImage:String,desc:String){
        ImageManager().setImage(url:img , imageView: self.img)
        ImageManager().setImage(url:authourImage , imageView: self.authorImage)
        self.authorLabel.text = author
        self.descriptionLabel.text = desc
    }
}
