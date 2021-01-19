//
//  ExploreViewModel.swift
//  4sq_explore
//
//  Created by Macbook on 19/1/2564 BE.
//

import Foundation
import Alamofire

protocol ExploreViewModelDelegate: class {
    func requertExploreApiDidSuccess()
    func requertExploreApiDidFailed()
}
class ExploreViewModel : NSObject {
    var exploreModel: ExploreModel?
    var delegate: ExploreViewModelDelegate?
    var groups: [Groups]?
    var items: [Items]?
    func requertExploreApi() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let vDate = formatter.string(from: date)
        let parameters: [String : Any] = [
            "near" : "NYC",
            "client_id" : "KSHBGMWCU0IM1CKIIDMLNIB5X3APBS5AMFGLJH5TDD35KNB1",
            "client_secret" : "FD31DATWAM5Z5VOTDWF4KXVZAJW5LS3VTXVQP1MX5SJHJWEQ",
            "ll" : "40.7,-74",
            "v" : vDate
        ]
        let request = AF.request("https://api.foursquare.com/v2/venues/explore", method: .get, parameters: parameters)
        
        request.responseDecodable(of: ExploreModel.self) { (response) in
            switch response.result{
            case .success:
                guard let response = response.value else { return }
                if response.meta?.code == 200 {
                    self.items = response.response?.groups?.first?.items
                    self.delegate?.requertExploreApiDidSuccess()
                } else {
                    self.delegate?.requertExploreApiDidFailed()
                }
            case .failure:
                self.delegate?.requertExploreApiDidFailed()
            }
          
        }
    }
    
    
}
