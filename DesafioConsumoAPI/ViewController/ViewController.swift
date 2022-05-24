//
//  ViewController.swift
//  DesafioConsumoAPI
//
//  Created by user212294 on 4/7/22.
//

import UIKit

final class ViewController: UIViewController {
    
    let mainView = MainView()

    override func loadView() {
        super.loadView()
        setupView()
    }


    func setupView() {
        self.view = mainView
        mainView.searchAction = clickedSearch        
    }
    
    func clickedSearch() {
        self.mainView.confifureView()
    }
}

