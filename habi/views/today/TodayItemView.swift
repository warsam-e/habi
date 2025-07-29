//
//  TodayItemView.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct TodayItemView: View {
  var item: HabiItem

  var body: some View {
    HStack(spacing: 18) {
      Image(systemName: item.icon_name)
        .resizable()
        .frame(width: 24)

      Text("\(item.name)")
        .font(.title3)
    }
    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
  }
}
