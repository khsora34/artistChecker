import UIKit
import Alamofire
import AlamofireObjectMapper

class SearchArtistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var artists = [Artist]()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search for artist"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchBar.delegate = self
        searchBar.placeholder = "Escribe aquí un artista"
        
        
        //El delegate permite a una clase delegar una funcionalidad a la implementada en otra clase.
        tableView.delegate = self
        //Cambia los parámetros
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.scrollsToTop = true
        tableView.separatorStyle = .none
        
        //Introduzco un elemento mío en el ciclo de vida
        let nib = UINib(nibName: "ArtistTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ArtistTableViewCellID")
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    //Número de secciones de tabla,
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Número de celdas en cada sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    //Rellenar celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let artist = artists[indexPath.row]
        
        //Coge una celda clonada como la celda que hemos hecho, si no hace una normal.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCellID") as? ArtistTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = artist.name
        cell.genreLabel.text = artist.genre
        
        return cell
    }
    
    //Si seleccionan una fila, hacer cosas.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenArtist = artists[indexPath.row]
        let detailStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let controller = detailStoryboard.instantiateViewController(withIdentifier: "ArtistsDetailID") as? ArtistsDetailController  else { return }
        controller.artist = chosenArtist

        Connector().getArtistsDiscographyById(id: chosenArtist.id ?? 000000){
            controller.discography = $0.filter{ $0.albumName != nil }
            
            //Sacamos al ArtistDetailController
            if let nav = self.navigationController {
                nav.pushViewController(controller, animated: true)
            }
        }
    }
}

extension SearchArtistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        tableView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.artists.removeAll()
            self.tableView.reloadData()
        } else {
            Connector().getArtistNameAndPrimaryGenre(terms: searchText.replacingOccurrences(of: " ", with: "+")) {
                self.artists = $0
                self.tableView.reloadData()
            }
        }
    }
}
