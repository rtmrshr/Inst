//
//  FeedViewController.swift
//  inst
//
//  Created by  ratmir on 13.03.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
           .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: true, isNewStory: false),
               FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: false, isNewStory: true),
               FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: false, isNewStory: true),
               FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: false, isNewStory: true),
               FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: false, isNewStory: true),
               FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: false, isNewStory: false),
               FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "user123", isAddButtonVisible: false, isNewStory: false)
           ])
           ]
    
}

//MARK: - Private methods

private extension FeedViewController {
    
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        tableView.dataSource = self
        tableView.separatorColor = .clear
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems()-> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapAddButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc func didTapAddButton() {
        print("Add")
    }
    
    @objc func didTapDirectButton() {
        print("Direct")
    }
    
    func makeDropDownMenu()-> UIMenu {
        let subsItem = UIAction(title: "Subscriptions", image: UIImage(systemName: "person.2")) { _ in
            print("Subscriptions")
        }
        let favsItem = UIAction(title: "Favorites", image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        return UIMenu(children: [subsItem, favsItem])
    }
}

//MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
    
    
}
