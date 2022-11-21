//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 21.11.2022.
//

import SwiftUI

struct ResortDetailsView: View {

  //MARK: - View Properties
  let resort: Resort
  var size: String {
    switch resort.size {
    case 1:
      return "Small"
    case 2:
      return "Avarage"
    default:
      return "Large"
    }
  }

  var price: String {
    String(repeating: "$", count: resort.price)
  }

  //MARK: - View Body
    var body: some View {
      Group {
        VStack {
          Text("Size")
            .font(.caption.bold())
          Text(size)
            .font(.title3)
        }

        VStack {
          Text("Price")
            .font(.caption.bold())
          Text(price)
            .font(.title3)
        }
      }
      .frame(maxWidth: .infinity)
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      ResortDetailsView(resort: Resort.example)
    }
}
