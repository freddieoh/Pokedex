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
  
  }

  @IBAction func backButtonPressed(_ sender: UIButton) {
    
    dismiss(animated: true, completion: nil)
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
