//
//  EditViewController.swift
//  dummyApp2
//
//  Created by Gagan Verma on 27/03/26.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    let name = UITextField()
    let designation = UITextField()
    let company = UITextField()
    let email = UITextField()
    let phone = UITextField()
    
    let saveButton = UIButton()
    let cancelButton = UIButton()
    
    
    override func viewDidLoad() {
        
        title = "Edit Data"
        super.viewDidLoad()
        
        setupTextFields()
        setupButtons()
        setupStackk()
    }

    func textFieldHelper(_ textfield: UITextField){
        textfield.text = ""
        textfield.borderStyle = .roundedRect
        textfield.textColor = .systemBlue
        textfield.backgroundColor = .secondarySystemBackground
        textfield.delegate = self
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func setupTextFields(){
        name.placeholder = "Enter Name"
        textFieldHelper(name)
        
        designation.placeholder = "Enter Designation"
        textFieldHelper(designation)
        
        company.placeholder = "Enter Company"
        textFieldHelper(company)
        
        email.placeholder = "Enter Email Address"
        textFieldHelper(email)
        
        phone.placeholder = "Enter Phone Number"
        textFieldHelper(phone)
    }
    func buttonConfig(_ button: UIButton,_ symbol: String){
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: symbol)
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        button.configuration = config
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 22
        
    }
    
    func setupButtons(){
        saveButton.setTitle("Save", for: .normal)
        buttonConfig(saveButton, "square.and.arrow.down.badge.checkmark.fill")
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        cancelButton.setTitle("Cancel", for: .normal)
        buttonConfig(cancelButton, "square.and.arrow.down.badge.xmark.fill")
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupStackk(){
        let vstack = UIStackView(arrangedSubviews: [
            name,
            designation,
            company,
            phone,
            email
        ])
        vstack.axis = .vertical
        vstack.spacing = 20
        vstack.distribution = .equalSpacing
        vstack.alignment = .fill
        
        let hstack = UIStackView(arrangedSubviews: [
            saveButton,
            cancelButton
        ])
        hstack.axis = .horizontal
        hstack.spacing = 20
        hstack.distribution = .fillEqually
        hstack.alignment = .fill
        
        
        let stack = UIStackView(arrangedSubviews: [
            vstack,
            hstack,
        ])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .equalSpacing
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            name.heightAnchor.constraint(equalToConstant: 44),
            designation.heightAnchor.constraint(equalToConstant: 44),
            company.heightAnchor.constraint(equalToConstant: 44),
            phone.heightAnchor.constraint(equalToConstant: 44),
            email.heightAnchor.constraint(equalToConstant: 44),
            saveButton.heightAnchor.constraint(equalToConstant: 44),
            cancelButton.heightAnchor.constraint(equalToConstant: 44),
            hstack.widthAnchor.constraint(equalTo: stack.widthAnchor),
        ])
    }
    
    
    @objc func saveTapped(){
        UserDefaults.standard.set(name.text, forKey: "userName")
        UserDefaults.standard.set(designation.text, forKey: "userDesignation")
        UserDefaults.standard.set(company.text, forKey: "userCompany")
        UserDefaults.standard.set(phone.text, forKey: "userPhone")
        UserDefaults.standard.set(email.text, forKey: "userEmail")
        
        let alert = UIAlertController(title: "Saved!", message: "Details Saved", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)
        navigationController?.popViewController(animated: true)

    }
    
    @objc func cancelTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}
