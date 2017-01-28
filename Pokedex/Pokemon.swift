//
//  Pokemon.swift
//  Pokedex
//
//  Created by Fredrick Ohen on 1/5/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit
import Alamofire


class Pokemon {
  
  private var _name: String!
  private var _pokedexId: Int!
  private var _description: String!
  private var _type: String!
  private var _defense: String!
  private var _height: String!
  private var _weight: String!
  private var _attack: String!
  private var _nextEvolutionText: String!
  private var _pokemonURL: String!
  
  var description: String {
    if _description == nil {
      _description = ""
    }
    return _description
  }
  
  var type: String {
    if _type == nil {
      _type = ""
    }
    return _type
  }
		
  var defense: String {
    if _defense == nil {
      _defense = ""
    }
    return _defense
  }
  
  var height: String {
    if _height == nil {
      _height = ""
    }
    return _height
  }
  
  var weight: String {
    if _weight == nil {
      _weight = ""
    }
    return _weight
  }
  
  var attack: String {
    if _attack == nil {
      _attack = "I'M NIL"
    }
    return _attack
  }
  
  var nextEvolutionText: String {
    if _nextEvolutionText ==  nil {
      _nextEvolutionText = ""
    }
    return _nextEvolutionText
  }
  
  var name: String {
    return _name
  }
  
  var pokedexId: Int {
    return _pokedexId
  }
  
  init(name: String, pokedexId: Int) {
    
    self._name = name
    self._pokedexId = pokedexId
    self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
  }
  
//  func test() {
//    
//  }
  
  func downloadPokemonDetail(completed: @escaping DownloadComplete) {
    
    Alamofire.request(_pokemonURL).responseJSON { (response) in
      
      guard let dict = response.result.value as? [String:Any] else {
        return print("Error")
      }
      
      guard let weight = dict["weight"] as? String else {
        return print("Weight error")
      }
      self._weight = weight
      
      guard let height = dict["height"] as? String else {
        return print("Height error")
      }
      self._height = height
      
      guard let attack = dict["attack"] as? Int else {
        return print("Attack error")
      }
      self._attack = "\(attack)"
      
      guard let defense = dict["defense"] as? Int else {
        return print("Defense error")
      }
      self._defense = "\(defense)"
      
    }
    completed()
  }
}
