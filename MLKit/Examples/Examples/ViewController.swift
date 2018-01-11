//
//  ViewController.swift
//  Examples
//
//  Created by Anh Vu on 12/13/17.
//  Copyright © 2017 Mobytelab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let features = ["Reusable","LGButton"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = features[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard(name: "Reusable", bundle: nil).instantiateViewController(ofType: ReusableViewController.self)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = UIStoryboard(name: "LGButtonTest", bundle: nil).instantiateViewController(ofType: LGButtonTestViewController.self)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

