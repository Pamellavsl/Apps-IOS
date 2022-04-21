//
//  ViewController.swift
//  bocaRosa_app
//
//  Created by Pamella Lima on 18/04/22.
//

import UIKit

class ProdutoController: UIViewController {
    
    private let viewModel: ProdutoViewModel = ProdutoViewModel()
    private var produtos: [Produtos] = []
    var filterButton = UIBarButtonItem()
    
    //MARK: - Atributes
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 7

        title = "Boca Rosa Beauty"
        configureNavigationBar()
        delegate()
        
        viewModel.delegate = self
        viewModel.fetchProduto()
        produtos = viewModel.produtos

    }
    
    private func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavigationBar() {
       filterButton = UIBarButtonItem(image: UIImage.init(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(orderView))
        filterButton.tintColor = .gray
        navigationItem.rightBarButtonItems = [filterButton]
    }
    
    @objc func orderView() {
        filterButton.tintColor = .black
        viewModel.ordenarTableView()
        DispatchQueue.main.async { [self] in
            self.tableView.reloadData()
        }
    }
}


//MARK: - Tableview configuration
extension ProdutoController: UITableViewDelegate { // controla o header, altura, a seleção de clique, linha que está clicando
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Eu cliquei na célula: \(indexPath.row)")
    }
    
}

extension ProdutoController:UITableViewDataSource { // manipulação de dados
    
    //quantinhas linhas vai ter a tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(produtos)
        return produtos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row // te dar a linha que tá
        self.tableView.rowHeight = 80
        
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let produtoOrder = viewModel.produtos[indexPath.row]
       cell.setup(logo: produtoOrder.logo, nomeProduto: produtoOrder.nomeProduto, categoria: produtoOrder.categoria, preco: produtoOrder.preco)
        
        return cell
    }
}

extension ProdutoController: ProdutoDelegate {
    func updateTableView() {
        tableView.reloadData()
    }
}
