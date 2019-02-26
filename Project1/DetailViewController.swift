//
//  DetailViewController.swift
//  Project1
//
//  Created by Catherine on 2/18/19.
//  Copyright © 2019 Catherine Priazhnikova. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var numberOfImage: Int?
    var amountOfImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo \(numberOfImage!) of \(amountOfImages!)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped () {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
            else {
                print("No image found")
                return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
