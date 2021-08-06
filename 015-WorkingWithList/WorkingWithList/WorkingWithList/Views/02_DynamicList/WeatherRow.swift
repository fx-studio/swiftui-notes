//
//  WeatherRow.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/6/21.
//

import SwiftUI

struct WeatherRow: View {
    
    var weather: Weather
    
    var body: some View {
        HStack {
            Image(weather.getStatusInfo())
                .resizable()
                .padding()
                .frame(width: 80.0, height: 80.0)
            VStack(alignment: .leading, content: {
                Text(weather.city)
                    .font(.title)
                Text(weather.country)
                    .fontWeight(.thin)
            })
            Spacer()
            Text("\(weather.temperature)°C")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(weather: Weather(city: "Hà Nội", country: "Việt Nam", temperature: 30, status: .sun))
    }
}
