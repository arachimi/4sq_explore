//
//  ExploreViewController.swift
//  4sq_explore
//
//  Created by Macbook on 19/1/2564 BE.
//

import UIKit
import SDWebImage
import PKHUD

class ExploreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = ExploreViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        viewModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        viewModel.requertExploreApi()
    }
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rows = viewModel.items?.count {
            return rows
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTableViewCell.identifier) as! ExploreTableViewCell
        if let placeName = viewModel.items?[indexPath.row].venue?.name {
            cell.lblPlaceName.text = placeName
        }
        if let address = viewModel.items?[indexPath.row].venue?.location?.formattedAddress {
            cell.lblPlaceAddress.text = "\(address[0]), \(address[1]) , \(address[2])"
        }
        
        if let placeImage = viewModel.items?[indexPath.row].venue?.categories?.first?.icon {
            if let prefix = placeImage.prefix, let suffix = placeImage.suffix {
                let size = 64
                let  url = "\(prefix)\(size)\(suffix)"
                cell.placeImage.layer.backgroundColor = UIColor.purple.cgColor
                cell.placeImage.layer.cornerRadius = cell.placeImage.layer.frame.width / 2
                cell.placeImage.sd_setImage(with: URL(string: url), completed: nil)
            }
        }
        return cell
    }
}

extension ExploreViewController: ExploreViewModelDelegate {
    func requertExploreApiDidSuccess() {
        tableView.reloadData()
        PKHUD.sharedHUD.hide()
    }
    
    func requertExploreApiDidFailed() {
        tableView.reloadData()
        PKHUD.sharedHUD.hide()
    }
}
