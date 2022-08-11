//
//  TypesViewController.swift
//  HaveNever
//
//  Created by Вадим Лавор on 10.08.22.
//

import UIKit

class TypesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var items = ["Общие", "Классические", "Детские"]
    var firstSelectedType: String = ""
    var secondSelectedType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToCards") {
            let cardsViewController = segue.destination as! CardsViewController
            cardsViewController.firstType = firstSelectedType
            if (!secondSelectedType.isEmpty) {
                cardsViewController.secondType = secondSelectedType
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.layer.cornerRadius = 20.0
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowRadius = 12.0
        cell.layer.shadowOpacity = 0.7
        cell.backgroundImage.image = UIImage(named: "\(indexPath.item + 1).png")
        cell.myLabel.text = self.items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.item == 0) {
            firstSelectedType = "school"
            secondSelectedType = "classic"
        } else if (indexPath.item == 1) {
            firstSelectedType = "classic"
        } else {
            firstSelectedType = "school"
        }
        performSegue(withIdentifier: "goToCards", sender: nil)
    }
    
    func setGradientBackground(view: UIView, colorTop: CGColor = UIColor(red: 29.0/255.0, green: 34.0/255.0, blue:234.0/255.0, alpha: 1.0).cgColor, colorBottom: CGColor = UIColor(red: 38.0/255.0, green: 0.0/255.0, blue: 6.0/255.0, alpha: 1.0).cgColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
}
