//
//  City.swift
//  MobileRNDAssignment
//
//  Created by Deni Smilevska on 6/8/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit

class City : Decodable {
   
    var country: String = ""
    var name: String = ""
    var _id: Int = 0
    var coord : Coordinate = Coordinate()
    var description: String {
        get{
            return "\(name), \(country)"
        }
    }
    
    private enum CodingKeys: String, CodingKey{
        case country
        case name
        case _id
        case coord
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decode(String.self, forKey: .country)
        name = try values.decode(String.self, forKey: .name)
        _id = try values.decode(Int.self, forKey: ._id)
        coord = try values.decode(Coordinate.self, forKey: .coord)
    }
    
}

class Coordinate: Decodable{
    var lon : Double = 0.0
    var lat : Double = 0.0
    var description: String{
        get {
            return "(\(lat), \(lon))"
        }
    }
    
    private enum CodingKeys: String, CodingKey{
        case lon
        case lat
    }
    
    init() {
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lon = try values.decode(Double.self, forKey: .lon)
        lat = try values.decode(Double.self, forKey: .lat)
        
    }

}

