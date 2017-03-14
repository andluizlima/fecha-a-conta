//
//  Cliente.swift
//  Fecha A Conta
//
//  Created by Andre Luiz Rodrigues on 10/03/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class Cliente: NSObject, NSCoding{
    let nome: String!
    var pedidos: [Pedido]!
    var total: Float!
    
    init(nome: String, total: Float) {
        self.nome = nome
        self.total = total
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let nome = aDecoder.decodeObject(forKey: "nomeCliente") as? String,
            let total = aDecoder.decodeObject(forKey: "totalCliente") as? Float
            else {
                return nil
        }
        
        self.init(nome: nome, total: total)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nomeCliente")
        aCoder.encode(total, forKey: "totalCliente")
    }
    
    func totalGasto() -> Float{
        var total: Float = 0
        for pedido in pedidos {
            total += pedido.valor
        }
        return total
    }
    
    func carregaDados(pedidos: [Pedido]) {
        self.pedidos = pedidos
    }
    
}
