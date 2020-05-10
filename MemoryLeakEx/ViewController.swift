//
//  ViewController.swift
//  MemoryLeakEx
//
//  Created by Pradeep on 10/05/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Page", style: .plain, target: self, action: #selector(goToNextPage))
    }

    @objc func goToNextPage(){
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

class Service {
    
    var secondVC: SecondViewController?
    //weak var secondVC: SecondViewController? // use this to resolve the memory leak
}

class SecondViewController: UITableViewController{
    
    let service = Service()
    
    deinit {
        print("os reclaming memory for secondviewcontroller")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.secondVC = self
        
        view.backgroundColor = .red
    }
}
