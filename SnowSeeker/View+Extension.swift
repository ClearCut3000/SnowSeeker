//
//  View+Extension.swift
//  SnowSeeker
//
//  Created by Николай Никитин on 21.11.2022.
//

import SwiftUI

extension View {
  @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
    if UIDevice.current.userInterfaceIdiom == .phone {
      self.navigationViewStyle(.stack)
    } else {
      self
    }
  }
}
