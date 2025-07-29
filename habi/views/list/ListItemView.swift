//
//  ItemView.swift
//  habi
//
//  Created by war on 2025-07-28.
//

import SwiftUI

struct ListItemView: View {
  @EnvironmentObject var manager: HabiManager
  var item: HabiItem

  var name: String {
    item.name ?? "Unknown"
  }

  var icon_name: String {
    item.icon_name ?? "square"
  }

  var deleteButtonLabel: some View { Label("Delete", systemImage: "trash") }
  func deleteButton(_ id: UUID) -> some View {
    Button(role: .destructive) {
      manager.removeItem(id)
    } label: {
      deleteButtonLabel
    }
  }

  var body: some View {
    HStack(spacing: 18) {
      Image(systemName: icon_name)
        .resizable()
        .frame(width: 24)

      Text("\(name)")
        .font(.title3)
    }
    .padding(EdgeInsets.init(top: 8, leading: 10, bottom: 8, trailing: 10))
    .swipeActions {
      if item.id != nil {
        deleteButton(item.id!)
      }

    }
  }
}
