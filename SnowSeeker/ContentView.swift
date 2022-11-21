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


  //MARK: - View Body
  var body: some View {
    NavigationView {
      List(resorts) { resort in
        NavigationLink {
          ResortView(resort: resort)
        } label: {
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
        }
      }
      .navigationTitle("Resorts")
      WelcomeView()
    }
  }


  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
}
