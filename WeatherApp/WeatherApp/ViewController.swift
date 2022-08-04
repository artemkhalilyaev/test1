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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed() {
        guard let text = searchTextField.text else { return }
        fetchWeather(city: text)
    }

    func fetchWeather(city: String) {
        let apiKey = "4f594b6caca6beb3a15d373071f8751a"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                // Make alert
            } else if let data = data,
                      let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    let weatherData: CurrentWeather
                    do {
                        weatherData = try JSONDecoder().decode(CurrentWeather.self, from: data)
                        self.currentWeather = weatherData
                        DispatchQueue.main.async {
                            self.showWeather()
                        }
                    } catch let errorDecode {
                        print(errorDecode)
                    }
                } else {
                    // Make Alert
                }
                
            }
        }

        task.resume()
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

