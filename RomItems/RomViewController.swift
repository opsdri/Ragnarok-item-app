//
//  RomViewController.swift
//  RomItems
//
//  Created by John on 1/4/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class RomViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var imagePicker = UIImagePickerController()
    
    @IBAction func photosTap(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cameraTap(_ sender: Any) {
    }
    
    @IBOutlet weak var romImageView: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        romImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()

        imagePicker.delegate = self
    
    }
    @IBAction func addTap(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game = Rom(context: context)
        game.title = titleTextField.text
        game.image = UIImagePNGRepresentation(romImageView.image!) as NSData?
    
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

   
    }
    @IBOutlet weak var titleTextField: UITextField!
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
