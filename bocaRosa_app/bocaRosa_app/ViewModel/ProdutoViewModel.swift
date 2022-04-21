//
//  ProdutoViewModel.swift
//  bocaRosa_app
//
//  Created by Pamella Lima on 20/04/22.
//

import Foundation
import AVFoundation

class ProdutoViewModel {
    
    private var count: Int = 0
    public var delegate: ProdutoDelegate?
    var produtos: [Produtos] = []
    
    public func fetchProduto() {
        produtos = prod
    }
    
    public func ordenarTableView() {
        count = count + 1
        print(count)
        
        if (count%2 == 0) {
            print("entrei no primeiro if")
            produtos.sort{$0.nomeProduto < $1.nomeProduto}

        }
        else {
            print("entrei no else")
            produtos.sort{$0.nomeProduto >  $1.nomeProduto}
        }
    }
}
