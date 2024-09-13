//
//  ViewController.swift
//  SuperHeroes-iOS
//
//  Created by Mañanas on 4/9/24.
//
import UIKit
class SearchBarViewController: UIViewController, UITableViewDataSource {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var superHeroList: [SuperHero] = []
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Setup TableView
        tableView.dataSource = self

        searchSuperHeroes("a")
        configureRefreshControl()
    }
    // MARK: TableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcell", for: indexPath) as! SearchTableViewCell
        
        let superHero = superHeroList[indexPath.row]
        
        cell.render(superHero: superHero)
        
        return cell
    }
    // MARK: Pull to refresh
    
    func configureRefreshControl(){
        // Add the
        tableView.refreshControl = UIRefreshControl()
        tableView?.refreshControl?.addTarget(self, action: #selector(handleredfreshController), for: .valueChanged)
    }
    
    @objc func handleredfreshController(){
        searchSuperHeroes("a")
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
            if let results = results{
                self.superHeroList = results
            }else{
                self.superHeroList = []
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                // Dismiss the refreshControl
                self.tableView.refreshControl?.endRefreshing()
            }
        }
        
    }
}
