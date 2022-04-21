//
//  CustomTableViewCell.swift
//  bocaRosa_app
//
//  Created by Pamella Lima on 18/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nomeProdutoLabel: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        logoImageView.layer.cornerRadius = 15
        // Initialization code
    }
    
    func setup(logo: String, nomeProduto: String, categoria: String, preco: String) {
        self.logoImageView.image = UIImage(named: logo)
        self.nomeProdutoLabel.text = nomeProduto
        self.categoriaLabel.text = categoria
        self.precoLabel.text = preco
    }

    static let altura: CGFloat = 50

}
