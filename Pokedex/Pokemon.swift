//
//  Pokemon.swift
//  Pokedex
//
//  Created by Fredrick Ohen on 1/5/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit


class Pokemon {
  
  fileprivate var _name: String!
  fileprivate var _pokedexId: Int!
  
  var name: String {
    return _name
  }
  
  var pokedexId: Int {
    return _pokedexId
  }
  
  init(name: String, pokedexId: Int) {
    
    self._name = name
    self._pokedexId = pokedexId
  }
  
}
