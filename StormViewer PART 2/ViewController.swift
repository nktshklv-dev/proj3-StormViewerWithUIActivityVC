//
//  ViewController.swift
//  StormViewer PART 2
//
//  Created by Nikita  on 6/6/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var images: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath
        let pictures = try! fm.contentsOfDirectory(atPath: path!)
        
        for picture in pictures{
            if picture.hasPrefix("nssl"){
                
                images.append(picture)
            }
        }
        print(images)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        
        cell.textLabel?.text = images[indexPath.row]
        return cell
    }


}

