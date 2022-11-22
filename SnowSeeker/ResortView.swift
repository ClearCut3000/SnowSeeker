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
  @Environment(\.horizontalSizeClass) var sizeClass
  @Environment(\.dynamicTypeSize) var typeSize

  @EnvironmentObject var favorites: Favorites

  @State private var selectedFacility: Facility?
  @State private var showingFacility = false

  //MARK: - View Body
    var body: some View {
      ScrollView {
        VStack(alignment: .leading, spacing: 0) {
          ZStack(alignment: .bottomTrailing) {
            Image(decorative: resort.id)
              .resizable()
              .scaledToFit()
            Text(resort.imageCredit)
              .font(.caption)
              .padding([.leading, .trailing], 8)
              .padding([.top, .bottom], 3)
              .background(.black.opacity(0.5))
              .foregroundColor(.white)
              .clipShape(Capsule())
              .offset(x: -5, y: -5)
          }

          HStack {
            if sizeClass == .compact && typeSize > .large {
              VStack(spacing: 10) { ResortDetailsView(resort: resort) }
              VStack(spacing: 10) { SkiDetailView(resort: resort) }
            } else {
              ResortDetailsView(resort: resort)
              SkiDetailView(resort: resort)
            }
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
            HStack {
              ForEach(resort.faciliryTypes) { facility in
                Button {
                  selectedFacility = facility
                  showingFacility = true
                } label: {
                  facility.icon
                    .font(.title)
                }
              }
            }
            Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                if favorites.contains(resort) {
                    favorites.remove(resort)
                } else {
                    favorites.add(resort)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
          }
          .padding(.horizontal)
        }
      }
      .navigationTitle("\(resort.name), \(resort.country)")
      .navigationBarTitleDisplayMode(.inline)
      .alert(selectedFacility?.name ?? "More informationn",
             isPresented: $showingFacility,
             presenting: selectedFacility) { _ in } message: { facility in
        Text(facility.description)
      }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        ResortView(resort: Resort.example)
      }
          .environmentObject(Favorites())
    }
}
