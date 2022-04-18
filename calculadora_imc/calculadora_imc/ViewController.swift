//
//  ViewController.swift
//  calculadora_imc
//
//  Created by Pamella Lima on 17/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var resultadoTextView: UILabel!
    
    @IBAction func calcularButton(_ sender: Any) {
        
        print("chamou botão")
        let isCampoVazio: Bool = conferirCamposVazios(peso: pesoTextField.text!, altura: alturaTextField.text!)
        if isCampoVazio {
            mostraAlert()
        }
        else {
            mostrarResultado()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculoImc(peso: String, altura: String) -> Double {
        
        let pesoInt = (peso as NSString).integerValue
        print(pesoInt)
        let converteAltura = altura.replacingOccurrences(of: ",", with: ".")
        let alturaDouble = (converteAltura as NSString).doubleValue
        print(alturaDouble)
        
        var resultado: Double = Double(pesoInt)/(alturaDouble*alturaDouble)
        print(resultado)
        
        return resultado
    }
    
    func mostrarResultado() {
        var resultadoLabel: String = ""
        resultadoTextView.isHidden = false
        let resultadoIMC = calculoImc(peso: pesoTextField.text!, altura: alturaTextField.text!)
        resultadoLabel = faixasIMC(resultado: resultadoIMC)
        
        resultadoTextView.text = "Seu IMC é: \(String(format: "%.2f", resultadoIMC)) \nFaixa de Peso: \(resultadoLabel)"
    }
    
    func faixasIMC(resultado: Double) -> String {
        if resultado < 18.5 {
            return "Abaixo do peso"
        }
        else if (resultado >= 18.5 && resultado <= 24.9) {
            return "Saudável"
        }
        else if (resultado >= 25 && resultado <= 29.9) {
            return "Sobrepeso"
        }
        else if (resultado >= 30 && resultado <= 39.9) {
            return "Obeso"
        }
        
        return "Muito Obeso"
    }
    
    func conferirCamposVazios(peso: String, altura: String) -> Bool{
        if peso == "" || altura == ""{
            return true
        }
        
        return false
    }
    
    func mostraAlert() {
        
        // criando o alerta
        let alert = UIAlertController(title: "Erro", message: "É necessário preencher os campos altura e peso", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


