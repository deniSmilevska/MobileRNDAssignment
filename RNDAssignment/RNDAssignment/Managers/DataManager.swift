//
//  DataManager.swift
//  MobileRNDAssignment
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    static let shared = DataManager()
    
    var allCities : [City] = [] // <- one array with all loaded cities sorted alphabetically so we dont have to load them again. Will just work with this array localy to get all the data from. We load this array only once, and we sort it only once.
    
    func loadCities(completion: @escaping() -> Void ) {
        if let path = Bundle.main.path(forResource: "cities", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path)
                    , options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([City].self, from: data)
                self.allCities = jsonData
                self.allCities.sort { (c1, c2) -> Bool in
                    return c1 < c2
                }
                completion()
            }
            catch let error{
                print(error.localizedDescription)
                completion()
            }
        }
        else{
            completion()
        }
    }
    
    func searchCitiesWithPrefix(prefix: String) -> [City]{ // cities are sorted
        var filteredList : [City] = []
        for city in self.allCities{ // look for all cities that start with the prefix entered in the search bar.
            if city.description.lowercased().starts(with: prefix.lowercased()) {
                filteredList.append(city)
            }
        }
        return filteredList
    }

}