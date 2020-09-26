//
//  MovieGridViewController.swift
//  flixer
//
//  Created by searto  on 9/24/20.
//  Copyright © 2020 Fanflor theodore. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieGridViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [[String:Any]]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data
            {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.collectionView.reloadData()
                
                print(self.movies)
            }
        }
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return movies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MovieDetailViewController")  as! MovieDetailViewController
            vc.movie = movies[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            //performSegue(withIdentifier: "detail", sender: self)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let movie = movies[indexPath.item]
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let PosterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af_setImage(withURL: PosterUrl!)
        
        return cell
        
    }
}
