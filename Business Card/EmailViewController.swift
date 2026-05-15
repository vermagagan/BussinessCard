//
//  EmailViewController.swift
//  dummyApp2
//
//  Created by Gagan Verma on 27/03/26.
//

import UIKit

class EmailViewController: UIViewController {

    let titleLabel = UILabel()
    let numberLabel = UILabel()
    let copyButton = UIButton()
    let emailButton = UIButton()
    let doneButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setupLabel()
        setupButton()
        setupStackk()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numberLabel.text = UserDefaults.standard.string(forKey: "userEmail")
    }
    
    func setupLabel(){
       titleLabel.text = "Email Contact"
       titleLabel.textColor = .systemBlue
       titleLabel.textAlignment = .center
       titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
       titleLabel.numberOfLines = 1
       titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
       numberLabel.text = "vermagagan1512@gmail.com"
       numberLabel.textColor = .systemBlue
       numberLabel.textAlignment = .center
       numberLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
       numberLabel.numberOfLines = 1
       numberLabel.translatesAutoresizingMaskIntoConstraints = false
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
    
    func setupButton(){
        copyButton.setTitle("Copy", for: .normal)
        buttonConfig(copyButton, "document.on.document.fill")
        copyButton.addTarget(self, action: #selector(copyTapped), for: .touchUpInside)
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailButton.setTitle("Send Mail", for: .normal)
        buttonConfig(emailButton, "mail")
        emailButton.addTarget(self, action: #selector(emailTapped), for: .touchUpInside)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.setTitle("Done", for: .normal)
        buttonConfig(doneButton, "checkmark.square.fill")
        doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
    func setupStackk(){
        let vstack = UIStackView(arrangedSubviews: [
            titleLabel,
            numberLabel
        ])
        vstack.axis = .vertical
        vstack.spacing = 20
        vstack.distribution = .equalSpacing
        vstack.alignment = .fill
        
        let hstack = UIStackView(arrangedSubviews: [
            copyButton,
            emailButton
        ])
        hstack.axis = .horizontal
        hstack.spacing = 20
        hstack.distribution = .fillEqually
        hstack.alignment = .fill
        
        
        let stack = UIStackView(arrangedSubviews: [
            vstack,
            hstack,
            doneButton
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
            emailButton.heightAnchor.constraint(equalToConstant: 44),
            copyButton.heightAnchor.constraint(equalToConstant: 44),
            hstack.widthAnchor.constraint(equalTo: stack.widthAnchor),
            
            doneButton.widthAnchor.constraint(equalToConstant: 104),
        ])
    }
    
    @objc func copyTapped(){
        UIPasteboard.general.string = numberLabel.text
        
        let alert = UIAlertController(title: "Copied!", message: "Email Copied to Clipboard", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)

    }
    
    @objc func emailTapped(){
        guard let url = URL(string: "mailto:vermagagan1512@gmail.com") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Cannot open - check URL format or simulator")
        }
    }
    
    @objc func doneTapped(){
        dismiss(animated: true)
    }
    
}
