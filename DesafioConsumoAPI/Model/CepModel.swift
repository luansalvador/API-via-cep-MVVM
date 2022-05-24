//
//  CEPModel.swift
//  DesafioConsumoAPI
//
//  Created by user212294 on 4/7/22.
//

import Foundation

struct Cep: Codable {
    let logradouro: String
    let localidade: String
    let uf: String
    let ddd: String
}
