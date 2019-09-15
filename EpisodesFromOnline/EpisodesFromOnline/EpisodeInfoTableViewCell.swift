//
//  EpisodeInfoTableViewCell.swift
//  EpisodesFromOnline
//
//  Created by Pursuit on 9/14/19.
//

import UIKit

class EpisodeInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeInfoImage: UIImageView!
    
    @IBOutlet weak var episodeInfoTitle: UILabel!
    
    @IBOutlet weak var episodeInfoSeason: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
