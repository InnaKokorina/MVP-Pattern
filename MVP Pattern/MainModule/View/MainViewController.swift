//
//  MainViewController.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 12.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.body
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailVC = ModulBuilder.createDetail(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
   
}
extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
