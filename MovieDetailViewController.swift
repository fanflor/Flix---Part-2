//
//  MovieDetailViewController.swift
//  flixer
//
//  Created by searto  on 9/24/20.
//  Copyright © 2020 Fanflor theodore. All rights reserved.
//

import UIKit
import Alamofire
class MovieDetailViewController: UIViewController
{

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    //    @IBOutlet weak var backdropView: UIImageView!
//
//    @IBOutlet weak var posterView: UIImageView!
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       testLabel.text = movie["title"] as? String
       testLabel.sizeToFit()
       synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w185"
       let posterPath = movie["poster_path"] as! String
        let PosterUrl = URL(string: baseUrl + posterPath)
        posterView.af_setImage(withURL: PosterUrl!)
       let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
       backDropView.af_setImage(withURL: backdropUrl!)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
