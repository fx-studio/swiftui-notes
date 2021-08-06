//
//  Weather.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/6/21.
//

import Foundation

struct Weather: Identifiable {
    
    enum WeatherStatus {
        case sun
        case rain
        case cloud
    }
    
    var id = UUID()
    var city: String
    var country: String
    var temperature: Int
    var status: WeatherStatus
    
    func getStatusInfo() -> String {
        var str = ""
        
        switch status {
        case .sun:
            str = "sun"
        case .rain:
            str = "cloud"
        case .cloud:
            str = "cloud"
        }
        
        return str
    }
}

// Dummy data
extension Weather {
    static func dummyData() -> [Weather] {
        return [Weather(city: "Hà Nội", country: "Việt Nam", temperature: 30, status: .sun),
                Weather(city: "Hải Phòng", country: "Việt Nam", temperature: 28, status: .cloud),
                Weather(city: "Đà Nẵng", country: "Việt Nam", temperature: 33, status: .rain),
                Weather(city: "Nha Trang", country: "Việt Nam", temperature: 27, status: .sun),
                Weather(city: "Đà Lạt", country: "Việt Nam", temperature: 20, status: .cloud),
                Weather(city: "Vũng Tàu", country: "Việt Nam", temperature: 30, status: .cloud),
                Weather(city: "Cần Thơ", country: "Việt Nam", temperature: 31, status: .sun),
                Weather(city: "Hồ Chí Minh", country: "Việt Nam", temperature: 35, status: .rain),
                Weather(city: "Tokyo", country: "Japan", temperature: 20, status: .cloud),
                Weather(city: "London", country: "England", temperature: 21, status: .rain),
                Weather(city: "NewYork", country: "USA", temperature: 35, status: .sun),
                Weather(city: "Beijing", country: "China", temperature: 30, status: .rain),
                Weather(city: "Paris", country: "France", temperature: 30, status: .rain),
                Weather(city: "Moscow", country: "Russia", temperature: 30, status: .rain)].shuffled()
    }
}
