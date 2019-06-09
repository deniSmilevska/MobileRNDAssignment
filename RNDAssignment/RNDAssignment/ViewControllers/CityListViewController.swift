//
//  CityListViewController.swift
//  RNDAssignment
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit

protocol CitySelectedDelegate{
    func citySelected(city: City)
}

class CityListViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var cityList: [City] = []
    var filteredList: [City] = []
    var delegate: CitySelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "cities", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path)
                    , options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([City].self, from: data)
                cityList = jsonData
                cityList.sort { (c1, c2) -> Bool in
                    return c1 < c2
                }
                filteredList = cityList
                self.tableView.reloadData()
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }
    //MARK: - Search delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshFilteredList(prefix: searchText)
        self.tableView.reloadData()
    }
    //MARK: - Helper functions
    func refreshFilteredList(prefix: String){
        self.filteredList.removeAll()
        //have a filter list so we can work with that one instead of loading the whole cityList json file again.
        for city in self.cityList{ // cities are sorted so we dont have to sort them again after adding them to the filter list
            if city.description.starts(with: prefix) {
                self.filteredList.append(city)
            }
        }
    }
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell{
            let city = self.filteredList[indexPath.row]
            cell.setupCellWith(city: city)
            return cell
        }
        return UITableViewCell()
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
