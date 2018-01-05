//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Fredrick Ohen on 1/12/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

  var pokemon: Pokemon?

  @IBOutlet weak var pokemonNameLabel: UILabel!
  @IBOutlet weak var pokemonDescriptionLabel: UILabel!
  @IBOutlet weak var pokemonHeightLabel: UILabel!
  @IBOutlet weak var pokemonWeightLabel: UILabel!
  @IBOutlet weak var pokemonDefenseLabel: UILabel!
  @IBOutlet weak var pokedexIdLabel: UILabel!
  @IBOutlet weak var pokemonAttackLabel: UILabel!
  @IBOutlet weak var currentEvolutionImageView: UIImageView!
  @IBOutlet weak var nextEvolutionImageView: UIImageView!
  @IBOutlet weak var evolutionLabel: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    pokemonNameLabel.text = pokemon?.name
    
    pokemon?.downloadPokemonDetail(completed: {
      
      print("Did arrive here")
      self.updateUI()
   
    })
  }
  
  func updateUI() {
    pokemonAttackLabel.text = pokemon?.attack
    pokemonDefenseLabel.text = pokemon?.defense
    pokemonHeightLabel.text = pokemon?.height
    pokemonWeightLabel.text = pokemon?.weight
  }

  @IBAction func backButtonPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}
