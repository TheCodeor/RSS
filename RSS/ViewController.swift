//
//  ViewController.swift
//  RSS
//
//  Created by fanpeng on 17/4/10.
//  Copyright © 2017年 fanpeng. All rights reserved.
//

import UIKit
import SWXMLHash

class ViewController: UIViewController {

    var channel =  [Channel]()
    var allItems = [Item]()
    
    @IBOutlet weak var rssTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        channel = LibraryAPI.sharedInstance.getChannel()
        allItems = channel[0].items
        print(allItems[0].title)
        rssTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.green
        cell.textLabel?.text = allItems[indexPath.row].title
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
