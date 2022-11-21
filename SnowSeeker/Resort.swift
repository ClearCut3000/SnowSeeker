//
//  Resort.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 20.11.2022.
//

import Foundation

struct Resort: Identifiable, Codable {
  let id: String
  let name: String
  let country: String
  let description: String
  let imageCredit: String
  let price: Int
  let size: Int
  let snowDepth: Int
  let elevation: Int
  let runs: Int
  let facilities: [String]

  var faciliryTypes: [Facility] {
    facilities.map(Facility.init)
  }

  static let alllResorts: [Resort] = Bundle.main.decode("resorts.json")

  static let example = alllResorts[0]
}
