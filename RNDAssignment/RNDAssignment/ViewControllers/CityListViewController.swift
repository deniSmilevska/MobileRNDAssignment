//
//  CityListViewController.swift
//  MobileRNDAssignment
//
//  Created by Deni Smilevska on 6/8/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit

protocol CitySelectedDelegate{
    func citySelected(city: City)
}

class CityListViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var delegate: CitySelectedDelegate?
    var filteredList : [City] = []
    var previousSearchedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.shared.loadCities { () in
            self.filteredList = DataManager.shared.allCities // initialy filtered list will contain all cities sorted alphabetically .
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Search functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let shouldLookInFilteredList =  previousSearchedString != "" && searchText.count > previousSearchedString.count
        refreshFilteredList(prefix: searchText, shouldLookInFilteredList: shouldLookInFilteredList)
        self.tableView.reloadData()
        previousSearchedString = searchText
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    //MARK: - Helper functions
    func refreshFilteredList(prefix: String , shouldLookInFilteredList: Bool){
        filteredList = DataManager.shared.searchCitiesWithPrefix(prefix: prefix, shouldLookInFilteredList: shouldLookInFilteredList)
    }
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell{
            let city = self.filteredList[indexPath.row]
            cell.setupCellWith(city: city)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let city = self.filteredList[indexPath.row]
            self.delegate?.citySelected(city: city)
            if let mapsController = self.delegate as? MapsViewController{
                self.splitViewController?.showDetailViewController(mapsController, sender: nil)
            }
        }
    }
}
