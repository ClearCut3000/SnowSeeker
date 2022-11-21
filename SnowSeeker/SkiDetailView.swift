//
//  SkiDetailView.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 21.11.2022.
//

import SwiftUI

struct SkiDetailView: View {

  //MARK: - View Properties
  let resort: Resort

  //MARK: - View Body
    var body: some View {
      Group {
        VStack {
          Text("Elevation")
            .font(.caption.bold())
          Text("\(resort.elevation)m")
            .font(.title3)
        }
        VStack {
          Text("Snow")
            .font(.caption.bold())
          Text("\(resort.snowDepth)cm")
            .font(.title3)
        }
      }
      .frame(maxWidth: .infinity)
    }
}

struct SkiDetailView_Previews: PreviewProvider {
    static var previews: some View {
      SkiDetailView(resort: Resort.example)
    }
}
