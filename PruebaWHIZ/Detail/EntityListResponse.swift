//
//  EntityListResponse.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//

import Foundation

import Foundation

public struct EntityListResponse:  Codable {
    public var resultCode: String?
    public var resultDescription: String?
    let entity: [EntityList]?
}

public struct EntityListJSONResponse: Codable {
    let version_ios: String?
    let entities: [EntityListJSON]?
}

public struct EntityList: Codable {
    let id: Int?
    let appEntityCode: String?
    let code: String?
    let name: String?
    let firstColor: String?
    let secondColor: String?
    let logo: String?
    let theme: String?
    
    let appServer: String?
    let videoServer: String?
    let videoStun: String?
    let videoNN: String?
    let videoNNi2cat: String?
}

struct EntityListJSON: Codable {
    let appEntityCode: String?
    let entity: String?
    let name: String?
    let firstColor: String?
    let secondColor: String?
    let logo: String?
    let theme: String?
    
    let appServer: String?
    let videoServer: String?
    let videoStun: String?
    let videoNN: String?
    let videoNNi2cat: String?
}

class Entity: NSObject, NSCoding {
    
    var id: Int?
    var appEntityCode: String?
    var code: String?
    var name: String?
    let firstColor: String?
    let secondColor: String?
    let logo: String?
    let theme: String?
    
    let appServer: String?
    let videoServer: String?
    let videoStun: String?
    let videoNN: String?
    let videoNNi2cat: String?
    
    init(json: [String: Any])
    {
        self.id = json["id"] as? Int
        self.appEntityCode = json["appEntityCode"] as? String
        self.code = json["code"] as? String
        self.name = json["name"] as? String
        self.firstColor = json["firstColor"] as? String
        self.secondColor = json["secondColor"] as? String
        self.logo = json["logo"] as? String
        self.theme = json["theme"] as? String
        
        self.appServer = json["appServer"] as? String
        self.videoServer = json["videoServer"] as? String
        self.videoStun = json["videoStun"] as? String
        self.videoNN = json["videoNN"] as? String
        self.videoNNi2cat = json["videoNNi2cat"] as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.appEntityCode, forKey: "appEntityCode")
        aCoder.encode(self.code, forKey: "code")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.firstColor, forKey: "firstColor")
        aCoder.encode(self.secondColor, forKey: "secondColor")
        aCoder.encode(self.logo, forKey: "logo")
        aCoder.encode(self.theme, forKey: "theme")
        
        aCoder.encode(self.appServer, forKey: "appServer")
        aCoder.encode(self.videoServer, forKey: "videoServer")
        aCoder.encode(self.videoStun, forKey: "videoStun")
        aCoder.encode(self.videoNN, forKey: "videoNN")
        aCoder.encode(self.videoNNi2cat, forKey: "videoNNi2cat")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.appEntityCode = aDecoder.decodeObject(forKey: "appEntityCode") as? String
        self.code = aDecoder.decodeObject(forKey: "code") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.firstColor = aDecoder.decodeObject(forKey: "firstColor") as? String
        self.secondColor = aDecoder.decodeObject(forKey: "secondColor") as? String
        self.logo = aDecoder.decodeObject(forKey: "logo") as? String
        self.theme = aDecoder.decodeObject(forKey: "theme") as? String
        
        
        self.appServer = aDecoder.decodeObject(forKey: "appServer") as? String
        self.videoServer = aDecoder.decodeObject(forKey: "videoServer") as? String
        self.videoStun = aDecoder.decodeObject(forKey: "videoStun") as? String
        self.videoNN = aDecoder.decodeObject(forKey: "videoNN") as? String
        self.videoNNi2cat = aDecoder.decodeObject(forKey: "videoNNi2cat") as? String
    }
    
}

public struct EntityListFilter: Codable {
    let id: Int?
    let appEntityCode: String?
    let code: String?
    let name: String?
    let firstColor: String?
    let secondColor: String?
    let logo: String?
    let theme: String?
    
    let appServer: String?
    let videoServer: String?
    let videoStun: String?
    let videoNN: String?
    let videoNNi2cat: String?
}
