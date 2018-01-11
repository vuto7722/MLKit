//
//  ReusableViewController.swift
//  Examples
//
//  Created by Anh Vu on 12/13/17.
//  Copyright © 2017 Mobytelab. All rights reserved.
//

import UIKit

class ReusableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.registerCell(ofType: ReuseTableCell.self)
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(ofType: ReuseTableCell.self, at: indexPath)
    }

}
