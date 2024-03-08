//
//  DetailViewController.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import UIKit
import Resolver


class DetailViewController: UIViewController {
    
    var ID : Int?
    
    @Injected var repository : Repository
    @LazyInjected var viewModel: DetailsViewModel
    


    
    @IBOutlet weak var personDescription: UILabel!
    @IBOutlet weak var personTitlee: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        
    }
    func bindViewModel(){
        viewModel.person.bind { person in
            self.person = person
        }
        viewModel.personID = ID
        
    }
    
    var person: Person? {
        didSet{
            
            
            personTitlee.text = person?.title
            personDescription.text = person?.desc
            if let url = person?.base64{
                image.sd_setImage(with: URL(string:url))
                
            }
        }
    }
    

}
