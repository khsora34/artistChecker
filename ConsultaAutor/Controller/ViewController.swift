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
        tableView.delegate = self
        tableView.dataSource = self
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCellID") as? ArtistTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = artist.artistName
        return cell
    }
    
    //Si seleccionan una fila, hacer cosas.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = artists[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "ArtistsDetailID") as? ArtistsDetail  else { return }
            controller.artist = object

            if let nav = navigationController {
                nav.pushViewController(controller, animated: true)
            }
    }
    
    // MARK: Actions
    
    @IBAction func buttonPressed(_ sender: Any) {
        Connector().getResponseObject(term: "Coldplay") {
            self.artists = $0
            self.tableView.reloadData()
        }

    }

}

