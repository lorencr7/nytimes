//
//  ArticleTableViewCell.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ArticleTableViewCell: UITableViewCell {
    
    static let nibName = "ArticleTableViewCell"
    static let reuseIdentifier = "ArticleTableViewCellReuseIdentifier"

    @IBOutlet weak var ivThumbnail: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbSection: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
   private var request: Alamofire.Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func config(articleViewModel: ArticleViewModel) {
        if self.request != nil {
            self.request?.cancel()
        }
        self.lbTitle.text = articleViewModel.title
        self.lbAuthor.text = articleViewModel.author
        self.lbSection.text = articleViewModel.section
        self.lbDate.text = articleViewModel.publishDate
        
        if let thumbnail = articleViewModel.thumbnail {
            self.ivThumbnail.image = thumbnail
        } else if let imageUrl = articleViewModel.imageUrl{
            print("downloading " + imageUrl.absoluteString)
            self.request = Alamofire.request(imageUrl).responseImage { response in
                guard response.result.value != nil else {
                    return
                }
                let image = response.result.value
                articleViewModel.thumbnail = image
                self.ivThumbnail.image = image
            }
        }
        

    }
    
}
