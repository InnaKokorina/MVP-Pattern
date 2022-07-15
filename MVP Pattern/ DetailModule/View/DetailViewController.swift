//
//  DetailViewController.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 14.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
     var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

    @IBAction func backTapped(_ sender: Any) {
        presenter.tapBack()
    }
}
extension DetailViewController: DetailViewProtocol {
    func showComment(comment: Comment?) {
        label.text = comment?.body
    }
    
    
}
