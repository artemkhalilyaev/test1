//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artem Khalilyaev on 2.08.22.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    var currentWeather: CurrentWeather?
    let networkService: NetworkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed() {
        guard let text = searchTextField.text else { return }
        fetchWeather(city: text)
    }

    func fetchWeather(city: String) {
        networkService.fetchWeather(city: city) { weather, error in
            if let weather = weather {
                self.currentWeather = weather
                DispatchQueue.main.async {
                    self.showWeather()
                }
            } else {
                // Show alert
            }
        }
    }

    func showWeather() {
        performSegue(withIdentifier: "showWeather", sender: self)
    }

    // Прячем клавиатуру
    @IBAction func screenTapped(_ sender: Any) {
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "showWeather" {
            let dest = segue.destination as? WeatherViewController
            dest?.currentWeather = currentWeather
        }
    }
}

