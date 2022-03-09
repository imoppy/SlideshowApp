//
//  EnlargedImageViewController.swift
//  SlideshowApp
//
//  Created by 若原 旬 on 2022/03/07.
//

import UIKit

class ImageViewController: UIViewController {

    var fileName: String = ""

    @IBOutlet weak var enlargedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        enlargedImage.image = UIImage(named: fileName)
    }
}
