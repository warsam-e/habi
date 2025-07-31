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

  func tapItem() {

  }

  var completeButton: some View {
    Button(action: {}) {
      Image(systemName: item.isCompletedToday ? "checkmark.circle.fill" : "circle")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
    }
  }

  var mainView: some View {
    HStack(alignment: .center) {
      HStack(spacing: 18) {
        Image(systemName: icon_name)
          .resizable()
          .scaledToFit()
          .frame(width: 24)
        Text("\(name)").font(.title3)
      }
      Spacer()
      completeButton
    }
    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
  }

  var body: some View {
    Button(action: { tapItem() }) { mainView }
  }
}
