//
//  EpisodeInfoViewController.swift
//  EpisodesFromOnline
//
//  Created by Pursuit on 9/14/19.
//

import UIKit

class EpisodeInfoViewController: UIViewController {

    @IBOutlet weak var episodeInfoTableView: UITableView!
    
    @IBOutlet weak var episodeSummary: UITextView!
    
    
    
    var episodeSource : EpisodeInfo!
    var episodeDetail = [EpisodeDetailInfo](){
        didSet{
            episodeInfoTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeInfoTableView.delegate = self
        episodeInfoTableView.dataSource = self
        loadEpisodeDetails()

    }
    
    func loadEpisodeDetails(){
        EpisodeInfoAPIClient.shared.getEpisodeInfo(edInt: episodeSource.id) {(result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let EpisodeDetailInfo):
                    self.episodeDetail = EpisodeDetailInfo
                }
            }
            
            
        }
    
    }
}

extension EpisodeInfoViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeDetail.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeInfoCell") as? EpisodeInfoTableViewCell else {return UITableViewCell()}
        let singleDetail = episodeDetail[indexPath.row]
        cell.episodeInfoTitle.text = singleDetail.name
        cell.episodeInfoSeason.text = "Season: \(singleDetail.season), Episode: \(singleDetail.id)"
        self.episodeSummary.text = singleDetail.summary
     
        
        guard let imageUrl = singleDetail.image?.original else {
            return UITableViewCell()
        }
        ImageHelper.shared.getImage(urlStr: imageUrl) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    cell.episodeInfoImage.image = image
                }
            }
        }
        return cell
    }
    
}

