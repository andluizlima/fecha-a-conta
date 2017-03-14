//
//  ViewController.swift
//  Fecha A Conta
//
//  Created by Andre Luiz Rodrigues on 08/03/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mesasPath: String{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Mesas").path
    }
    var clientesPath: String{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Clientes").path
    }
    var pedidosPath: String{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Pedidos").path
    }
    var pedidosDosClientesPath: String{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("PedidosDosClientes").path
    }
    var clientesDosPedidosPath: String{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("ClientesDosPedidos").path
    }
    
    var mesasAbertas = [Mesa]()
    var clientesMesasAbertas = [[Cliente]]()
    var pedidosMesasAbertas = [[Pedido]]()
    var pedidosDosClientesAbertos = [[Pedido]]()
    var clientesDosPedidosAbertos = [[Cliente]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        NSKeyedArchiver.archiveRootObject([], toFile: mesasPath)
//        NSKeyedArchiver.archiveRootObject([[]], toFile: clientesPath)
//        NSKeyedArchiver.archiveRootObject([[]], toFile: pedidosPath)
//        NSKeyedArchiver.archiveRootObject([[]], toFile: pedidosDosClientesPath)
//        NSKeyedArchiver.archiveRootObject([[]], toFile: clientesDosPedidosPath)
        
        
        mesasAbertas = NSKeyedUnarchiver.unarchiveObject(withFile: mesasPath) as! [Mesa]
        clientesMesasAbertas = NSKeyedUnarchiver.unarchiveObject(withFile: clientesPath) as! [[Cliente]]
        pedidosMesasAbertas = NSKeyedUnarchiver.unarchiveObject(withFile: pedidosPath) as! [[Pedido]]
        pedidosDosClientesAbertos = NSKeyedUnarchiver.unarchiveObject(withFile: pedidosDosClientesPath) as! [[Pedido]]
        clientesDosPedidosAbertos = NSKeyedUnarchiver.unarchiveObject(withFile: clientesDosPedidosPath) as! [[Cliente]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "novaMesa" {
            let destino = segue.destination as! NewViewController
            
            destino.mesasAbertas = mesasAbertas
            destino.clientesMesasAbertas = clientesMesasAbertas
            destino.pedidosMesasAbertas =  pedidosMesasAbertas
            destino.pedidosDosClientesAbertos = pedidosDosClientesAbertos
            destino.clientesDosPedidosAbertos = clientesDosPedidosAbertos
            
            destino.mesasPath = mesasPath
            destino.clientesPath = clientesPath
            destino.pedidosPath = pedidosPath
            destino.pedidosDosClientesPath = pedidosDosClientesPath
            destino.clientesDosPedidosPath = clientesDosPedidosPath
        }
    }

}

