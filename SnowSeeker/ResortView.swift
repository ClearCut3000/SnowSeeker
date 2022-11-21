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
  @State private var selectedFacility: Facility?
  @State private var showingFacility = false

  //MARK: - View Body
    var body: some View {
      ScrollView {
        VStack(alignment: .leading, spacing: 0) {
          Image(decorative: resort.id)
            .resizable()
            .scaledToFit()

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
      ResortView(resort: Resort.example)
    }
}
