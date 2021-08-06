//
//  WeatherDetail.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/6/21.
//

import SwiftUI

struct WeatherDetail: View {
    var weather: Weather
    
    var body: some View {
        VStack(alignment: .center) {
            CircleImage(name: "img1")
            HStack {
                Image(weather.getStatusInfo())
                    .padding(.all)
                    .frame(width: 80.0, height: 80.0)
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading) {
                    Text(weather.city)
                        .font(.title)
                    Text(weather.country)
                        .fontWeight(.thin)
                }
                Spacer()
                Text("\(weather.temperature)°C")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.all)
            }
            Spacer()
            }.navigationBarTitle(Text(weather.city), displayMode: .inline)
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail(weather: Weather(city: "Hà Nội", country: "Việt Nam", temperature: 30, status: .sun))
    }
}
