//
//  ViewController.swift
//  Pokedex
//
//  Created by Fredrick Ohen on 1/5/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var pokemon: [Pokemon] = []
  var filteredPokemon: [Pokemon] = []
  var musicPlayer: AVAudioPlayer!
  var inSearchMode = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
    collectionView.delegate = self
    searchBar.delegate = self
    searchBar.returnKeyType = .done
    
    parsePokemonCSV()
    initAudio()
    
  }
  
  func initAudio() {
    
    let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
    
    do {
      musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
      musicPlayer?.prepareToPlay()
      musicPlayer?.numberOfLoops = -1
      musicPlayer?.play()
    } catch let error as NSError {
      
      print(error.debugDescription)
    }
  }
  
  func parsePokemonCSV() {
    
    let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
    
    do {
      let csv = try CSV(contentsOfURL: path)
      let rows = csv.rows
      
      for row in rows {
//Force unwrapping because data is in csv.swift file
        
        let pokeId = Int(row["id"]!)!
        let name = row["identifier"]!
        
        let poke = Pokemon(name: name, pokedexId: pokeId)
        pokemon.append(poke)
        
      }
      
    } catch let error as NSError {
      
      print(error.debugDescription)
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
      
      let poke: Pokemon!
      
      if inSearchMode {
        poke = filteredPokemon[indexPath.row]
        cell.configureCell(poke)
      } else {
        poke = pokemon[indexPath.row]
        cell.configureCell(poke)
      }
      cell.configureCell(poke)
      
      return cell
    }
    else {
      return UICollectionViewCell()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
    var poke: Pokemon?
    
    if inSearchMode {
      poke = filteredPokemon[indexPath.row]
    } else {
      poke = pokemon[indexPath.row]
    }
   
    performSegue(withIdentifier: "PokemonDetailVC", sender: poke)
  
  }
 
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if inSearchMode {
      return filteredPokemon.count
    }
    return pokemon.count
  }
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  @IBAction func musicButtonPressed(_ sender: UIButton) {
    
    if musicPlayer.isPlaying {
      musicPlayer?.pause()
      sender.alpha = 0.2
    }  else {
      musicPlayer?.play()
      sender.alpha = 1.0
    }
  }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 104, height: 104)
  }

}
// MARK: UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
// Edit search button for soft keyboard
  
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    defer {collectionView.reloadData()}
    
    inSearchMode = !searchText.isEmpty
    guard inSearchMode else { view.endEditing(true); return }
    
    let lower = searchText.lowercased()
    filteredPokemon = pokemon.filter { $0.name.range(of: lower) != nil }

  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    view.endEditing(true)
  }

}
