//
//  Mesa.swift
//  Fecha A Conta
//
//  Created by Andre Luiz Rodrigues on 10/03/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class Mesa: NSObject, NSCoding{
    
    var local: String!
    var clientes: [Cliente]!
    var pedidos: [Pedido]!
    var total: Float!
    
    init(local: String, total: Float) {
        self.local = local
        self.total = total
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let local = aDecoder.decodeObject(forKey: "nomeLocal") as? String,
        let total = aDecoder.decodeObject(forKey: "totalLocal") as? Float
            else{return nil}

        self.init(local: local, total: total)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(local, forKey: "nomeLocal")
        aCoder.encode(total, forKey: "totalLocal")
    }
    
    func carregaDados(clientes: [Cliente], pedidos: [Pedido]) {
        self.clientes = clientes
        self.pedidos = pedidos
    }
}
