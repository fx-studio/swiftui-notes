//
//  WeatherList.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/6/21.
//

import SwiftUI

struct WeatherList: View {
    
    var weathers = Weather.dummyData()
    
    var body: some View {
        NavigationView {
            List(weathers) { item in
                NavigationLink(
                    destination: WeatherDetail(weather: item),
                    label: {
                        WeatherRow(weather: item)
                    })
            }
            .navigationBarTitle(Text("Weather List"))
//            .navigationBarItems(trailing:
//                                    Button(action: {
//                                        //action
//                                    }, label: {
//                                        Text("Add")
//                                    })
//            )
        }
        
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList()
    }
}
