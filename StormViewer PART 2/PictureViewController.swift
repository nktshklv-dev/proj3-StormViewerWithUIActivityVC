//
//  PictureViewController.swift
//  StormViewer PART 2
//
//  Created by Nikita  on 6/6/22.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var currentImage = ""
    var images = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: currentImage)
        title = "Picture \(images.firstIndex(of: currentImage)! + 1) of \(images.count)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        
    }
    
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else{
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, currentImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
        
    }
    
    
}
