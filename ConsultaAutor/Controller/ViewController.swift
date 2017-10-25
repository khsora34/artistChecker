//
//  ViewController.swift
//  ConsultaAutor
//
//  Created by Quico on 23/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var artists = [Artist]()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //El delegate permite a una clase delegar una funcionalidad a la implementada en otra clase.
        tableView.delegate = self
        
        //Cambia los parámetros
        tableView.dataSource = self
        
        searchBar.delegate = self
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
        
        guard let controller = detailStoryboard.instantiateViewController(withIdentifier: "ArtistsDetailID") as? ArtistsDetailController  else { /*No hagas nada*/ return }
        controller.artist = chosenArtist
        
        //Sacamos al ArtistDetailController
        if let nav = navigationController {
            nav.pushViewController(controller, animated: true)
        }
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty { return }
        
        Connector().getResponseObject(term: searchText.replacingOccurrences(of: " ", with: "+")) {
            self.artists = $0
            self.tableView.reloadData()
        }
    }
}
