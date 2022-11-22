//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 22.11.2022.
//

import Foundation

class Favorites: ObservableObject {

  private var resorts: Set<String>
  private let saveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Favorites")

  init() {
    if let data = try? Data(contentsOf: saveURL) {
      if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
        resorts = decoded
        return
      }
    }
    resorts = []
  }

  func contains(_ resort: Resort) -> Bool {
    resorts.contains(resort.id)
  }

  func add(_ resort: Resort) {
    objectWillChange.send()
    resorts.insert(resort.id)
    save()
  }

  func remove(_ resort: Resort) {
    objectWillChange.send()
    resorts.remove(resort.id)
    save()
  }

  func save() {
    if let data = try? JSONEncoder().encode(resorts) {
      try? data.write(to: saveURL, options: [.atomic, .completeFileProtection])
    }
  }
}
