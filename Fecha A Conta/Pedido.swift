//
//  Pedido.swift
//  Fecha A Conta
//
//  Created by Andre Luiz Rodrigues on 10/03/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class Pedido: NSObject, NSCoding{
    
    var produto: String!
    var valor: Float!
    var clientes: [Cliente]!
    
    init(produto: String, valor: Float) {
        self.produto = produto
        self.valor = valor
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let produto = aDecoder.decodeObject(forKey: "nomeProduto") as? String,
            let valor = aDecoder.decodeObject(forKey: "valorProduto") as? Float
            else {return nil}
        
        self.init(produto: produto, valor: valor)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(produto, forKey: "nomeProduto")
        aCoder.encode(valor, forKey: "valorProduto")
    }
    
    func carregaDados(clientes: [Cliente]) {
        self.clientes = clientes
    }
}
