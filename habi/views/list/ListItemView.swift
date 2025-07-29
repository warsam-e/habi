//
//  ItemView.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct ListItemView: View {
  @StateObject private var manager = HabiManager.shared
  var item: HabiItem

  var deleteButtonLabel: some View { Label("Delete", systemImage: "trash") }
  var deleteButton: some View {
    Button(role: .destructive) {
      manager.removeItem(item.id)
    } label: {
      deleteButtonLabel
    }
  }

  var body: some View {
    HStack(spacing: 18) {
      Image(systemName: item.icon_name)
        .resizable()
        .frame(width: 24)

      Text("\(item.name)")
        .font(.title3)
    }
    .padding(EdgeInsets.init(top: 8, leading: 10, bottom: 8, trailing: 10))
    .swipeActions {
      deleteButton
    }
  }
}
