//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 21.11.2022.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    VStack {
      Text("Welcome to SnowSeeker!")
        .font(.largeTitle)

      Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
        .foregroundColor(.secondary)
    }
  }
}

struct Welcome_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
