//
//  SearchAlgorithmTest.swift
//  MobileRNDAssignmentTests
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import XCTest
@testable import RNDAssignment

class SearchAlgorithmTest: XCTestCase {
    
    func testSearchAlgorithmWithValidPrefix(){
        DataManager.shared.loadCities { () in
           let list = DataManager.shared.searchCitiesWithPrefix(prefix: "Al")
            //we should have multiple cities with this prefix
            XCTAssertTrue(list.count > 0)
        }
        
    }
    func testSearchAlgorithmLowercasedPrefix(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "al")
            //we should have multiple cities with this prefix
            XCTAssertTrue(list.count > 0)
        }
    }
    func testSearchAlgorithmUppercasedPrefix(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "AL")
            //we should have multiple cities with this prefix
            XCTAssertTrue(list.count > 0)
        }
    }
    func testSearchAlgorithmWithInvalidPrefix(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: " ")
            //no city names start with empty space
            XCTAssertFalse(list.count > 0)
        }
        
    }
    func testSearchAlgorithWithSpecialCharacters(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "!")
            XCTAssertFalse(list.count > 0)
        }
    }
    
    func testSearchForNonExistingCity(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "NONEXISTINGCITY")
           
            XCTAssertFalse(list.count > 0)
        }
    }
    func testSearchForOneSpecificCity(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "Skopje")
            if list.count > 0{
                let skopjeCity = list[0]
                XCTAssertTrue(skopjeCity.name == "Skopje")
            }
            else{
                XCTFail()
            }
        }
    }
    func testSearchWithEmptyPrefix(){
        //should return all cities
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "")
            XCTAssertTrue(list.count == DataManager.shared.allCities.count)
        }
    }
    

}
