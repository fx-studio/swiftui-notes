//
//  SongListView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/22/21.
//

import SwiftUI

struct SongListView: View {
    
    @StateObject var viewmodle = SongListViewModel()
    
    init() {
        //viewmodle.loadAPI()
    }
    
    @ViewBuilder
    var stateContent: some View {
        switch viewmodle.apiState {
        case .loading:
            ZStack {
                RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1))
                ProgressView {
                    Text("Loading...")
                        .font(.title2)
                }
            }.frame(width: 120, height: 120, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray,lineWidth: 2))
            
        case .success:
            NavigationView {
                List(viewmodle.songs) { song in
                    SongRow(song: song)
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle(Text("Songs"))
            }
        case .failure(let error):
            Text(error.localizedDescription)
                .font(.title)
        }
    }
    
    @ViewBuilder
    func buildContent() -> some View {
        switch viewmodle.apiState {
        case .loading:
            ZStack {
                RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1))
                ProgressView {
                    Text("Loading...")
                        .font(.title2)
                }
            }.frame(width: 120, height: 120, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray,lineWidth: 2))
            
        case .success:
            NavigationView {
                List(viewmodle.songs) { song in
                    SongRow(song: song)
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle(Text("Songs"))
            }
        case .failure(let error):
            Text(error.localizedDescription)
                .font(.title)
        }
    }
    
    var body: some View {
        HStack {
            //buildContent()
            stateContent
        }
        .onAppear {
            viewmodle.loadAPI()
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
