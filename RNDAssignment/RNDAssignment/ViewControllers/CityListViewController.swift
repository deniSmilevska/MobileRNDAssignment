//
//  CityListViewController.swift
//  RNDAssignment
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cityList: [City] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "limitedCities", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path)
                    , options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([City].self, from: data)
                cityList = jsonData
                self.tableView.reloadData()
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }
    
}
extension CityListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell{
            let city = self.cityList[indexPath.row]
            cell.setupCellWith(city: city)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
