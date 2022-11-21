//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 21.11.2022.
//

import SwiftUI

struct ResortView: View {

  //MARK: - View Properties
  let resort: Resort

  //MARK: - View Body
    var body: some View {
      ScrollView {
        VStack(alignment: .leading, spacing: 0) {
          Image(decorative: resort.id)
            .resizable()
            .scaledToFit()

          HStack {
            ResortDetailsView(resort: resort)
            SkiDetailView(resort: resort)
          }
          .padding(.vertical)
          .background {
            Color.primary.opacity(0.1)
          }

          Group {
            Text(resort.description)
              .padding(.vertical)

            Text("Facilities")
              .font(.headline)
            Text(resort.facilities, format: .list(type: .and))
              .padding(.vertical)
          }
          .padding(.horizontal)
        }
      }
      .navigationTitle("\(resort.name), \(resort.country)")
      .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
      ResortView(resort: Resort.example)
    }
}
