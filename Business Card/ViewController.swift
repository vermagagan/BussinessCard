//
//  ViewController.swift
//  dummyApp2
//
//  Created by Gagan Verma on 25/03/26.
//

import UIKit

class ViewController: UIViewController {

    let bannerPhoto = UIImageView()
    let photo = UIImageView()
    
    let companyLabel = UILabel()
    let nameLabel = UILabel()
    let desciptionLabel = UILabel()
    
    let phoneButton = UIButton()//modal view for phone number and a copy to clipboard button
    let emailButton = UIButton()//modal view for email and a copy to clipboard button
    
    let linkedinButton = UIButton()//direct linkedin open
    let githubButton = UIButton()//direct github open
    
    let editButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupPhotos()
        
        setupLabels()
        
        setupButtons()
        
        setupStack()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = UserDefaults.standard.string(forKey: "userName")
        desciptionLabel.text = UserDefaults.standard.string(forKey: "userDesignation")
        companyLabel.text = UserDefaults.standard.string(forKey: "userCompany")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        photo.layer.cornerRadius = (photo.frame.width)/2
    }

    func setupPhotos(){
        bannerPhoto.image = UIImage(named: "GaganBanner")
        bannerPhoto.contentMode = .scaleAspectFill
        bannerPhoto.clipsToBounds = true
        bannerPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        photo.image = UIImage(named: "Gagan")
        photo.contentMode = .scaleAspectFill
        photo.layer.borderWidth = 5
        photo.layer.borderColor = UIColor.systemBlue.cgColor
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels(){
        companyLabel.text = "XYZ pvt. ltd."
        companyLabel.textColor = .systemBlue
        companyLabel.textAlignment = .center
        companyLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        companyLabel.numberOfLines = 1
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "Gagan Verma"
        nameLabel.textColor = .systemBlue
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        desciptionLabel.text = "iOS learning student final year of B.tech CSE"
        desciptionLabel.textColor = .systemBlue
        desciptionLabel.textAlignment = .center
        desciptionLabel.font = UIFont.systemFont(ofSize: 20)
        desciptionLabel.numberOfLines = 0
        desciptionLabel.translatesAutoresizingMaskIntoConstraints = false
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
        phoneButton.setTitle("Phone", for: .normal)
        buttonConfig(phoneButton, "phone.fill")
        phoneButton.addTarget(self, action: #selector(phoneTapped), for: .touchUpInside)
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailButton.setTitle("Email", for: .normal)
        buttonConfig(emailButton, "mail.stack")
        emailButton.addTarget(self, action: #selector(emailTapped), for: .touchUpInside)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkedinButton.setTitle("LinkedIn", for: .normal)
        buttonConfig(linkedinButton, "link")
        linkedinButton.addTarget(self, action: #selector(linkedinTapped), for: .touchUpInside)
        linkedinButton.translatesAutoresizingMaskIntoConstraints = false
        
        githubButton.setTitle("Github", for: .normal)
        buttonConfig(githubButton, "chevron.left.forwardslash.chevron.right")
        githubButton.addTarget(self, action: #selector(githubTapped), for: .touchUpInside)
        githubButton.translatesAutoresizingMaskIntoConstraints = false
        
        editButton.setTitle("Edit", for: .normal)
        buttonConfig(editButton, "slider.horizontal.3")
        editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupStack(){
        let hstack1 = UIStackView(arrangedSubviews: [
            phoneButton,
            emailButton
        ])
        hstack1.axis = .horizontal
        hstack1.spacing = 25
        hstack1.distribution = .fillEqually
        hstack1.alignment = .fill
        
        let hstack2 = UIStackView(arrangedSubviews: [
            linkedinButton,
            githubButton,
        ])
        hstack2.axis = .horizontal
        hstack2.spacing = 20
        hstack2.distribution = .fillEqually
        hstack2.alignment = .fill
        
        let vstack2 = UIStackView(arrangedSubviews: [
            nameLabel,
            desciptionLabel,
        ])
        vstack2.axis = .vertical
        vstack2.spacing = 20
        vstack2.distribution = .equalSpacing
        vstack2.alignment = .fill
        
        let Vstack = UIStackView(arrangedSubviews: [
            bannerPhoto,
            companyLabel,
            photo,
            vstack2,
            hstack1,
            hstack2,
            editButton
        ])
        Vstack.axis = .vertical
        Vstack.spacing = 15
        Vstack.distribution = .equalSpacing
        Vstack.alignment = .center
        
        Vstack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Vstack)
        
        NSLayoutConstraint.activate([
            Vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            Vstack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            Vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            Vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            bannerPhoto.heightAnchor.constraint(equalToConstant: 180),
               bannerPhoto.widthAnchor.constraint(equalTo: Vstack.widthAnchor),
               photo.widthAnchor.constraint(equalToConstant: 120),
               photo.heightAnchor.constraint(equalToConstant: 120),
            
            phoneButton.heightAnchor.constraint(equalToConstant: 44),
            emailButton.heightAnchor.constraint(equalToConstant: 44),
            linkedinButton.heightAnchor.constraint(equalToConstant: 44),
            githubButton.heightAnchor.constraint(equalToConstant: 44),
            editButton.widthAnchor.constraint(equalToConstant: 94),
            
            hstack1.widthAnchor.constraint(equalTo: Vstack.widthAnchor),
            hstack2.widthAnchor.constraint(equalTo: Vstack.widthAnchor)
        ])
    }

    
    @objc func editTapped(){
        let vc = EditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func phoneTapped(){
        let vc = PhoneViewController()
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
        
    }
    
    @objc func emailTapped(){
        let vc = EmailViewController()
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    @objc func linkedinTapped(){
        guard let url = URL(string: "https://www.linkedin.com/in/vermagagan") else{return}
        UIApplication.shared.open(url)
    }
    
    @objc func githubTapped(){
        guard let url = URL(string: "https://github.com/vermagagan") else {return}
        UIApplication.shared.open(url)
    }
    
}

