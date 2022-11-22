//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 20.11.2022.
//

import SwiftUI

struct ContentView: View {
  //MARK: - View Properties
  let resorts: [Resort] = Bundle.main.decode("resorts.json")
  @State private var searchTaxt = ""
  var filteredResorts: [Resort] {
    if searchTaxt.isEmpty {
      return resorts
    } else {
      return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchTaxt) }
    }
  }
  @StateObject var favorites = Favorites()

  //MARK: - View Body
  var body: some View {
    NavigationView {
      List(filteredResorts) { resort in
        NavigationLink {
          ResortView(resort: resort)
        } label: {
          HStack {
            Image(resort.country)
              .resizable()
              .scaledToFill()
              .frame(width: 40, height: 25)
              .clipShape(
                RoundedRectangle(cornerRadius: 5)
              )
              .overlay(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(.black, lineWidth: 1)
              )
            
            VStack(alignment: .leading) {
              Text(resort.name)
                .font(.headline)
              Text("\(resort.runs) runs")
                .foregroundColor(.secondary)
            }
            if favorites.contains(resort) {
              Spacer()
              Image(systemName: "heart.fill")
                .accessibilityLabel("This is a favorite resort.")
                .foregroundColor(.red)
            }
          }
        }
      }
      .navigationTitle("Resorts")
      .searchable(text: $searchTaxt, prompt: "Search for a resort...")
      WelcomeView()
    }
    .environmentObject(favorites)
  }


  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
}
