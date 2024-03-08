//
//  ListViewController.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import UIKit
import Alamofire
import Resolver

class ListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @LazyInjected var viewModel: PeopleListViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    var people: [Person]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        prepareLayout()
    }
    
    func bindViewModel() {
        viewModel.people.bind { people in
            self.people = people
        }
        viewModel.initialize()
    }
    
    func prepareLayout() {
        let nib = UINib(nibName: "PersonCell", bundle: nil)
        collectionView.register(nib,forCellWithReuseIdentifier: "person")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
    
        
    }
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "person", for: indexPath) as! PersonCell
        cell.person = people?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height: 124)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailsController") as! DetailViewController
        controller.ID = people?[indexPath.row].id
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
