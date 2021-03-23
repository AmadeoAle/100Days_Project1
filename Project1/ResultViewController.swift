//
//  ResultViewController.swift
//  Project1
//
//  Created by Amadeo on 22/03/21.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageResult: UIImageView!
    var imageString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = imageString
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
        if let imageToLoad = imageString{
            imageResult.image = UIImage(named: imageToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

}
