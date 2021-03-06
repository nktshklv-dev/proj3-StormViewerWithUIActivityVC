//
//  ViewController.swift
//  StormViewer PART 2
//
//  Created by Nikita  on 6/6/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var images: [String] = []{
        didSet{
            images = images.sorted(by: {
                s1, s2 in s1.prefix(8) < s2.prefix(8)
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let fm = FileManager.default
            let path = Bundle.main.resourcePath
            let pictures = try! fm.contentsOfDirectory(atPath: path!)
            
            for picture in pictures{
                if picture.hasPrefix("nssl"){
                    
                    self?.images.append(picture)
                }
            }
        }
        DispatchQueue.main.async { [weak self] in
            self?.title = "Storm Viewer"
            self?.navigationController?.navigationBar.prefersLargeTitles = true
            self?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self?.recommendTheApp))
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        
        cell.textLabel?.text = images[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let storyB = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyB.instantiateViewController(withIdentifier: "Image") as! PictureViewController
        
        vc.currentImage = images[indexPath.row]
        vc.images = self.images
        
        navigationController?.pushViewController(vc, animated: true)
        
       
    }
    
    @objc func recommendTheApp(){
        let vc = UIActivityViewController(activityItems: ["The storm viewer app is the coolest one! Go now and download it from the AppStore. "], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }


}

                                            
