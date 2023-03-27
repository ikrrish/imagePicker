//
//  ViewController.swift
//  imagePicker
//
//  Created by R82 on 27/03/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate&UINavigationControllerDelegate{

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func showAlert(){
        let alert = UIAlertController.init(title: "Your Choice", message: "", preferredStyle:.actionSheet)
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {_ in self.openGallery()}))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        img.image = info[.originalImage] as! UIImage
        dismiss(animated: true, completion: nil)
    }
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        present(gallery, animated: true, completion: nil)
    }
    @IBAction func imgButtonAction(_ sender: Any) {
        showAlert()
    }
}

