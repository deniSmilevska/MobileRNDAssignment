//
//  SearchAlgorithmTest.swift
//  RNDAssignmentTests
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import XCTest
@testable import RNDAssignment

class SearchAlgorithmTest: XCTestCase {
    
    func testSearchAlgorithmWithValidPrefix(){
        DataManager.shared.loadCities { () in
           let list = DataManager.shared.searchCitiesWithPrefix(prefix: "Al", shouldLookInFilteredList: false)
            //we should have multiple cities with this prefix
            XCTAssertTrue(list.count > 0)
        }
        
    }
    func testSearchAlgorithmLowercasedPrefix(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "al", shouldLookInFilteredList: false)
            //we should have multiple cities with this prefix
            XCTAssertTrue(list.count > 0)
        }
    }
    func testSearchAlgorithmUppercasedPrefix(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "AL", shouldLookInFilteredList: false)
            //we should have multiple cities with this prefix
            XCTAssertTrue(list.count > 0)
        }
    }
    func testSearchAlgorithmWithInvalidPrefix(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: " ", shouldLookInFilteredList: false)
            //no city names start with empty space
            XCTAssertFalse(list.count > 0)
        }
        
    }
    func testSearchAlgorithWithSpecialCharacters(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "!", shouldLookInFilteredList: false)
            XCTAssertFalse(list.count > 0)
        }
    }
    
    func testSearchForNonExistingCity(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "NONEXISTINGCITY", shouldLookInFilteredList: false)
           
            XCTAssertFalse(list.count > 0)
        }
    }
    func testSearchForOneSpecificCity(){
        DataManager.shared.loadCities { () in
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "Skopje", shouldLookInFilteredList: false)
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
            let list = DataManager.shared.searchCitiesWithPrefix(prefix: "", shouldLookInFilteredList: false)
            XCTAssertTrue(list.count == DataManager.shared.allCities.count)
        }
    }
    

}
