//
//  NewConversationViewController.swift
//  Messenger
//
//  Created by Cheng Xue on 3/22/23.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let spinner = JGProgressHUD(style: .dark)
    private let noResultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = " Search for users "
        searchBar.delegate = self
        
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        noResultLabel.text = "No Results"
        noResultLabel.textAlignment = .center
        noResultLabel.textColor = .green
        noResultLabel.font = .systemFont(ofSize: 21, weight: .medium)
        noResultLabel.isHidden = true
        
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        searchBar.becomeFirstResponder()
        
        view.backgroundColor = .white
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true)
    }

}

extension NewConversationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
