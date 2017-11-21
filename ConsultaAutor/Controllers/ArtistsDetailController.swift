import UIKit

class ArtistsDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Exigimos la variable para que espere a cargarla.
    var discography: [Album]!
    var artist: Artist!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = artist.name
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollsToTop = true
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AlbumTableViewCellID")
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discography.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if discography.isEmpty {
            print("WTF?!")
            discography.append(Album())
        }
        
        let album = discography[indexPath.row];

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCellID") as? AlbumTableViewCell else { return UITableViewCell() }
        
        if let albumName = album.albumName, let albumYear = album.year, let imageUrl = album.imageUrl {
            cell.nombreAlbum.text = albumName
            cell.añoAlbum.text = albumYear.getAgeFromStringAndFormatToString
            cell.albumImage.setImage(with: imageUrl)
        }
        
        return cell
    }
}
