//
//  MainView.swift
//  DesafioConsumoAPI
//
//  Created by user212294 on 4/7/22.
//

import UIKit

final class MainView: UIView {
    
    var searchAction: (() -> Void)?
    
    private lazy var titleAppLabel: UILabel = {
        let view = UILabel()
        view.text = "Consultor de CEP"
        view.textColor = .white
        view.font = view.font.withSize(30)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var inputCepTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "Digite um CEP"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let view = UIButton()
        view.setTitle("Pesquisar", for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(self.performSearch), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var addressLabel: UILabel = {
        let view = UILabel()
        view.text = "Logradouro:"
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.minimumScaleFactor = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "Localidade/UF:"
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.minimumScaleFactor = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var dddLabel: UILabel = {
        let view = UILabel()
        view.text = "DDD:"
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.minimumScaleFactor = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init() {
        super .init(frame: .zero)
        setupView()
        setupAditionalConfig()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(self.inputCepTextField)
        self.addSubview(self.searchButton)
        self.addSubview(self.addressLabel)
        self.addSubview(self.cityLabel)
        self.addSubview(self.dddLabel)
        self.addSubview(self.titleAppLabel)

    }
    
    public func confifureView() {
        guard Int(inputCepTextField.text!) != nil else { return }
        APIViaCepViewModel.searchCep(inputCepTextField.text!) { (cep) in
            DispatchQueue.main.sync {
                self.addressLabel.text = "Logradouro: \(cep.logradouro)"
                self.cityLabel.text = "Localidade/UF: \(cep.localidade)/\(cep.uf)"
                self.dddLabel.text = "DDD: \(cep.ddd)"
            }
        }

    }
    
    private func setupAditionalConfig() {
        self.backgroundColor = .purple
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleAppLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 175),
            self.titleAppLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.inputCepTextField.topAnchor.constraint(equalTo: self.titleAppLabel.bottomAnchor, constant: 50),
            self.inputCepTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.inputCepTextField.trailingAnchor.constraint(equalTo: self.searchButton.leadingAnchor, constant: -5),
            self.inputCepTextField.heightAnchor.constraint(equalTo: self.searchButton.heightAnchor),
            
            self.searchButton.centerYAnchor.constraint(equalTo: self.inputCepTextField.centerYAnchor),
            self.searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.searchButton.widthAnchor.constraint(equalToConstant: 100),
            
            self.addressLabel.topAnchor.constraint(equalTo: self.inputCepTextField.bottomAnchor, constant: 50),
            self.addressLabel.leadingAnchor.constraint(equalTo: self.inputCepTextField.leadingAnchor),
            self.addressLabel.trailingAnchor.constraint(equalTo: self.searchButton.trailingAnchor),
            
            self.cityLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 5),
            self.cityLabel.leadingAnchor.constraint(equalTo: self.addressLabel.leadingAnchor),
            self.cityLabel.trailingAnchor.constraint(equalTo: self.addressLabel.trailingAnchor),
            
            self.dddLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 5),
            self.dddLabel.leadingAnchor.constraint(equalTo: self.cityLabel.leadingAnchor),
            self.dddLabel.trailingAnchor.constraint(equalTo: self.cityLabel.trailingAnchor)
        
        ])
    }
    
    @objc private func performSearch() {
        self.searchAction?()
    }
    
}
