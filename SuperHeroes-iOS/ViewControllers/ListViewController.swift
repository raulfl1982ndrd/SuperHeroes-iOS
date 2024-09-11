//
//  ViewController.swift
//  SuperHeroes-iOS
//
//  Created by Mañanas on 4/9/24.
//
import UIKit
class ListViewController: UIViewController, UITableViewDataSource,UISearchBarDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var superHeroList: [SuperHero] = []
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup SearchBar
        let search = UISearchController(searchResultsController: nil)
        //search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        // Do any additional setup after loading the view.
        //Setup TableView
        tableView.dataSource = self

        searchSuperHeroes("a")
    }
    // MARK: TableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuperHeroViewCell
        
        let superHero = superHeroList[indexPath.row]
        
        cell.render(superHero: superHero)
        
        return cell
    }
    
    // MARK: SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("He pulsado Buscar")
        searchSuperHeroes(searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("He pulsado Cancelar")
        searchSuperHeroes("a")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("He escrito \(searchText)")
        
        if(searchText.isEmpty){
            searchSuperHeroes("a")
        }
        
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            let viewController = segue.destination as! DetailViewController

            let indexPath = tableView.indexPathForSelectedRow!

            viewController.superHero = superHeroList[indexPath.row]

            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

    // MARK: Business Logic
    func searchSuperHeroes(_ query:String){
        
        //Search Data
        /*SuperHeroProvider.findSuperHeroesByName("Super", withResult: { [unowned self] [weak self] results in
            self.superHeroList = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        })*/

        Task {
            let results = try? await SuperHeroProvider.findSuperHeroesByName(query)

            self.superHeroList = results!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
}
