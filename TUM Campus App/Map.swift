//
//  Map.swift
//  TUM Campus App
//
//  Created by Mathias Quintero on 12/11/15.
//  Copyright © 2015 LS1 TUM. All rights reserved.
//

import Foundation
class Map: ImageDownloader, DataElement {
    let roomID: String
    let mapID: String
    let description: String
    let scale: Int
    init(roomID: String, mapID: String, description: String, scale: Int) {
        self.roomID = roomID
        self.mapID = mapID
        self.description = description
        self.scale = scale
        let url = RoomFinderApi.BaseUrl.rawValue +  RoomFinderApi.MapImage.rawValue + roomID + "/" + mapID
        super.init()
        if let sanitizedURL = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) {
            getImage(sanitizedURL)
        }
    }
    
    func getCellIdentifier() -> String {
        return "map"
    }
    
    var text: String {
        return description
    }
    
}
