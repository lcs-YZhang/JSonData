//
//  ContentView.swift
//  JSonData
//
//  Created by Steven Zhang on 2021-02-20.
//

import SwiftUI

struct ContentView: View {
    //MARK: Stored properties
    
    //keep track of what what the user search for
    @State private var searchText = ""
    
    //Keep the list of songs retrieve from apple music
    @State private var songs: [Song] = []
    
    //MARK: Computed properties
    var body: some View {
        
        VStack {
            
            SearchBarView(text: $searchText)
                .onChange(of: searchText) { _ in
                    fetchSongResult()
                }
            
            //Show a prompt when no search text given
            if searchText.isEmpty {
                
                Spacer()
                
                Text("Please enter an artist name")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Spacer()
                
            } else {
                
                //Search text was given, results obtained
                //Show the list of result
                //Keypath of \.trackid tells us the list view what property to use
                List(songs, id: \.trackId ) {currentSong in
                    
                    VStack(alignment: .leading) {
                        
                        Text(currentSong.trackName)
                        
                        Text(currentSong.artistName)
                            .font(.caption)
                        
                    }
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
