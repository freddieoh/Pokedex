//
//  PokeCell.swift
//  Pokedex
//
//  Created by Fredrick Ohen on 1/6/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
  
  @IBOutlet weak var thumbImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var pokemon: Pokemon!
  
  fileprivate func roundCornersForCell() {
    layer.cornerRadius = 5.0
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    roundCornersForCell()
  }
  
  func configureCell(_ pokemon: Pokemon) {
    self.pokemon = pokemon
    nameLabel.text = self.pokemon.name.capitalized
    thumbImage.image = UIImage(named: "\(pokemon.pokedexId)")
    
  }
}
