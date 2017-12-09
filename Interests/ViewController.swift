//
//  ViewController.swift
//  Interests
//
//  Created by Scott Richards on 12/7/17.
//  Copyright © 2017 BitWyze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - IBOutlets
    private var dataSource = CardData.createCards()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = ["per_page" : "5"]
        DataProvider.singleton.loadBlogs(params: params, completion: { (cardData) in
            self.dataSource = cardData
            self.collectionView.reloadData()
        }) { (error) in
            print("Error loading Feed: \(error.debugDescription)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadBlogCompletion(cardData : [CardData]) {
        dataSource = cardData
        self.collectionView.reloadData()
    }

}

extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        
        if let cardCell = cell as? CardCell, indexPath.row < dataSource.count {
            let cardData = dataSource[indexPath.row]
            cardCell.populateCell(data:cardData)
        }
        
        return cell
    }
}
