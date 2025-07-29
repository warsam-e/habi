//
//  TodayItemView.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct TodayItemView: View {
  var item: HabiItem

  var name: String {
    item.name ?? "Unknown"
  }

  var icon_name: String {
    item.icon_name ?? "square"
  }

  var body: some View {
    HStack(spacing: 18) {
      Image(systemName: icon_name)
        .resizable()
        .frame(width: 24)

      Text("\(name)")
        .font(.title3)
    }
    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
  }
}
