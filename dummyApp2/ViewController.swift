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
    let linkedinQRButton = UIButton()//modal view with a qr for linkedin
    let githubQRButton = UIButton()//modal view with a qr for github
    
    let editButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotos()
        
        setupLabels()
        
        setupButtons()
        
        setupStack()
        
    }

    func setupPhotos(){
        bannerPhoto.image = UIImage(named: "GaganBanner")
        bannerPhoto.contentMode = .scaleAspectFit
        bannerPhoto.clipsToBounds = true
        bannerPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        photo.image = UIImage(named: "Gagan")
        photo.contentMode = .scaleAspectFill
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.systemBlue.cgColor
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels(){
        companyLabel.text = "Animer"
        companyLabel.textColor = .white
        companyLabel.textAlignment = .center
        companyLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        companyLabel.numberOfLines = 1
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "Gagan"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        desciptionLabel.text = "iOS learning student in final year of B.tech CSE"
        desciptionLabel.textColor = .white
        desciptionLabel.textAlignment = .center
        desciptionLabel.font = UIFont.systemFont(ofSize: 20)
        desciptionLabel.numberOfLines = 0
        desciptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupButtons(){
        phoneButton.setTitle("Phone", for: .normal)
        phoneButton.setTitleColor(.lightGray, for: .normal)
        phoneButton.backgroundColor = .systemBlue
        phoneButton.layer.cornerRadius = 22
        phoneButton.layer.borderWidth = 2
        phoneButton.layer.borderColor = UIColor.systemGray.cgColor
        phoneButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        phoneButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailButton.setTitle("Email", for: .normal)
        emailButton.setTitleColor(.lightGray, for: .normal)
        emailButton.backgroundColor = .systemBlue
        emailButton.layer.cornerRadius = 22
        emailButton.layer.borderWidth = 2
        emailButton.layer.borderColor = UIColor.systemGray.cgColor
        emailButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        emailButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkedinButton.setTitle("LinkedIn", for: .normal)
        linkedinButton.setTitleColor(.lightGray, for: .normal)
        linkedinButton.backgroundColor = .systemBlue
        linkedinButton.layer.cornerRadius = 12
        linkedinButton.layer.borderWidth = 2
        linkedinButton.layer.borderColor = UIColor.systemGray.cgColor
        linkedinButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        linkedinButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
        linkedinButton.translatesAutoresizingMaskIntoConstraints = false
        
        githubButton.setTitle("Github", for: .normal)
        githubButton.setTitleColor(.lightGray, for: .normal)
        githubButton.backgroundColor = .systemBlue
        githubButton.layer.cornerRadius = 12
        githubButton.layer.borderWidth = 2
        githubButton.layer.borderColor = UIColor.systemGray.cgColor
        githubButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        githubButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
        githubButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkedinQRButton.setTitle("LinkedInQR", for: .normal)
        linkedinQRButton.setTitleColor(.lightGray, for: .normal)
        linkedinQRButton.backgroundColor = .systemBlue
        linkedinQRButton.layer.cornerRadius = 12
        linkedinQRButton.layer.borderWidth = 2
        linkedinQRButton.layer.borderColor = UIColor.systemGray.cgColor
        linkedinQRButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        linkedinQRButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
        linkedinQRButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        githubQRButton.setTitle("GithubQR", for: .normal)
        githubQRButton.setTitleColor(.lightGray, for: .normal)
        githubQRButton.backgroundColor = .systemBlue
        githubQRButton.layer.cornerRadius = 12
        githubQRButton.layer.borderWidth = 2
        githubQRButton.layer.borderColor = UIColor.systemGray.cgColor
        githubQRButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        githubQRButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
        githubQRButton.translatesAutoresizingMaskIntoConstraints = false
        
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.lightGray, for: .normal)
        editButton.backgroundColor = .systemBlue
        editButton.layer.cornerRadius = 12
        editButton.layer.borderWidth = 2
        editButton.layer.borderColor = UIColor.systemGray.cgColor
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        editButton.addTarget(self, action: #selector(DetailTapped), for: .touchUpInside)
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
            linkedinQRButton,
            githubQRButton
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
        Vstack.spacing = 10
        Vstack.distribution = .equalSpacing
        Vstack.alignment = .fill
        
        Vstack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Vstack)
        
        NSLayoutConstraint.activate([
            Vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            Vstack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            Vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            Vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }

    
    @objc func DetailTapped(){
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

