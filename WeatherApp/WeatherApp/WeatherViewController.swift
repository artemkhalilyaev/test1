//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Artem Khalilyaev on 2.08.22.
//

import UIKit

class WeatherViewController: UIViewController {

    var currentWeather: CurrentWeather?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Pereshlo")
        print(currentWeather?.main.temp)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
