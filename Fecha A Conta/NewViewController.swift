//
//  NewViewController.swift
//  Fecha A Conta
//
//  Created by Andre Luiz Rodrigues on 10/03/17.
//  Copyright © 2017 Andre Luiz Rodrigues. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    var consumidores = [Cliente]()
    
    var mesasAbertas: [Mesa]!
    var clientesMesasAbertas: [[Cliente]]!
    var pedidosMesasAbertas: [[Pedido]]!
    var pedidosDosClientesAbertos: [[Pedido]]!
    var clientesDosPedidosAbertos: [[Cliente]]!
    
    @IBOutlet var nomeLocal: UITextField!
    @IBOutlet var taxaServico: UITextField!
    @IBOutlet var nomePessoa: UITextField!
    @IBOutlet var pessoas: UILabel!

    var mesasPath: String!
    var clientesPath: String!
    var pedidosPath: String!
    var pedidosDosClientesPath: String!
    var clientesDosPedidosPath: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NSKeyedArchiver.archiveRootObject([], toFile: mesasAbertasPath)
//        NSKeyedArchiver.archiveRootObject([[]], toFile: clientesPath)
//        NSKeyedArchiver.archiveRootObject([[]], toFile: pedidosPath)
//        NSKeyedArchiver.archiveRootObject([[[]]], toFile: pedidosDoClientePath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func addPessoa(_ sender: Any) {
        var teste = nomePessoa.text
        teste = teste?.replacingOccurrences(of: " ", with: "")
        if (teste != ""){
            let novoCliente = Cliente(nome: nomePessoa.text!, total: 0)
            novoCliente.carregaDados(pedidos: [])
            
            consumidores.append(novoCliente)
            pessoas.text = mostraPessoas()
            nomePessoa.text = ""
        }
    }
    
    func mostraPessoas() -> String {
        if(consumidores.count == 0){
            return ""
        } else if consumidores.count == 1{
            return consumidores[0].nome + "."
        } else if consumidores.count == 2{
            return consumidores[0].nome + " e " + consumidores[1].nome + "."
        }
        return consumidores[0].nome + " e mais " + String(consumidores.count - 1) + " pessoas."
    }
    
    @IBAction func cancelarNovo(_ sender: Any) {
        consumidores = []
        nomeLocal.text = ""
        taxaServico.text = ""
        nomePessoa.text = ""
    }
    
    func criaMesa(){
        let novaMesa: Mesa = Mesa(local: nomeLocal.text!, total: 0)
        let novosPedidos = [Pedido]()
        let novosClientes = [Cliente]()
        
        novaMesa.carregaDados(clientes: novosClientes, pedidos: novosPedidos)
        mesasAbertas.append(novaMesa)
        
        print(mesasAbertas.count)
        
        clientesMesasAbertas.append(consumidores)
        
        pedidosMesasAbertas.append(novosPedidos)
        pedidosDosClientesAbertos.append(novosPedidos)
        
        clientesDosPedidosAbertos.append(novosClientes)
        
        NSKeyedArchiver.archiveRootObject(mesasAbertas, toFile: mesasPath)
        NSKeyedArchiver.archiveRootObject(clientesMesasAbertas, toFile: clientesPath)
        NSKeyedArchiver.archiveRootObject(pedidosMesasAbertas, toFile: pedidosPath)
        NSKeyedArchiver.archiveRootObject(pedidosDosClientesAbertos, toFile: pedidosDosClientesPath)
        NSKeyedArchiver.archiveRootObject(clientesDosPedidosAbertos, toFile: clientesDosPedidosPath)
    }

    @IBAction func criaNovo(_ sender: Any) {
        var teste = nomeLocal.text
        teste = teste?.replacingOccurrences(of: " ", with: "")
        if(teste == ""){
            //Cria o alerta em si, definindo o título, mensagem e o estilo (.alert ou .actionSheet)
            let alertaController = UIAlertController(title: "Local sem nome", message: "Favor inserir um nome para o local onde estão.", preferredStyle: .alert )
            
            //Cria os botões com o título, estilo (.default, .cancel ou .destructive) e a ação que o botão fará
            let confirmar = UIAlertAction(title: "OK", style: .default , handler: nil)
            
            //Adiciona os botões ao alerta a partir de um método no próprio alerta
            alertaController.addAction(confirmar)
            
            //Mostra o alerta tal, se será com animação e o que fazer assim que algo for clicado no alerta
            present(alertaController, animated: true, completion: nil)
        } else if(consumidores.count == 0){
            //Cria o alerta em si, definindo o título, mensagem e o estilo (.alert ou .actionSheet)
            let alertaController = UIAlertController(title: "Não há ninguém adicionado", message: "Favor inserir pelo menos dois consumidores.", preferredStyle: .alert )
            
            //Cria os botões com o título, estilo (.default, .cancel ou .destructive) e a ação que o botão fará
            let confirmar = UIAlertAction(title: "OK", style: .default , handler: nil)
            
            //Adiciona os botões ao alerta a partir de um método no próprio alerta
            alertaController.addAction(confirmar)
            
            //Mostra o alerta tal, se será com animação e o que fazer assim que algo for clicado no alerta
            present(alertaController, animated: true, completion: nil)
        } else if(consumidores.count == 1){
            //Cria o alerta em si, definindo o título, mensagem e o estilo (.alert ou .actionSheet)
            let alertaController = UIAlertController(title: "Apenas uma pessoa adicionada", message: "Favor inserir pelo menos dois consumidores.", preferredStyle: .alert )
            
            //Cria os botões com o título, estilo (.default, .cancel ou .destructive) e a ação que o botão fará
            let confirmar = UIAlertAction(title: "OK", style: .default , handler: nil)
            
            //Adiciona os botões ao alerta a partir de um método no próprio alerta
            alertaController.addAction(confirmar)
            
            //Mostra o alerta tal, se será com animação e o que fazer assim que algo for clicado no alerta
            present(alertaController, animated: true, completion: nil)
        } else if(taxaServico.text == ""){
            //Cria o alerta em si, definindo o título, mensagem e o estilo (.alert ou .actionSheet)
            let alertaController = UIAlertController(title: "Você não inseriu a taxa de serviço", message: "Deseja usar a padrão de 10%?\nVocê poderá alterar isso mais tarde.", preferredStyle: .alert )
            
            //Cria os botões com o título, estilo (.default, .cancel ou .destructive) e a ação que o botão fará
            let confirmar = UIAlertAction(title: "Usar 10%", style: .default , handler: nil)
            let cancelar = UIAlertAction(title: "Colocar outra", style: .default , handler: nil)
            
            //Adiciona os botões ao alerta a partir de um método no próprio alerta
            alertaController.addAction(cancelar)
            alertaController.addAction(confirmar)
            
            //Mostra o alerta tal, se será com animação e o que fazer assim que algo for clicado no alerta
            present(alertaController, animated: true, completion: nil)
        } else {
            criaMesa()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let mesas: [Mesa] = NSKeyedUnarchiver.unarchiveObject(withFile: mesasPath) as! [Mesa]
        print(mesas.count)
        if mesas.count != 0{
            print(mesas[0].local)
        }
    }
}
