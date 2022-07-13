//
//  MainViewController.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 12.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapButtonAction(_ sender: Any) {
        presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        label.text = greeting
    }
    
    
}
