//
//  Downloader.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/22/21.
//

import Foundation
import SwiftUI
import Combine

class Downloader: ObservableObject {
    
    @Published var data = Data()
    
    //API
    func loadAPI(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }.resume()
    }
}
