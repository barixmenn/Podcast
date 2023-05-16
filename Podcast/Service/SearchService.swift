//
//  Service.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation
import Alamofire


final class SearchService {
    static func fetchData(searchText: String) {
        let parameters = ["media": "podcast", "term": searchText]
        AF.request(BASE_URL, parameters: parameters).responseData { response in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            guard let data = response.data else {return}
            do{
                let searchResult = try JSONDecoder().decode(Search.self, from: data)
                print(searchResult.results)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
