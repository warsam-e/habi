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

  var created_at: String {
    guard let date = item.created_at else { return "Unknown" }
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter.string(from: date)
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
        .scaledToFit()
        .frame(width: 24)

      VStack(alignment: .leading) {
        Text("\(name)").font(.title3)

        Text("\(created_at)").font(.subheadline).foregroundColor(.secondary)
      }
    }
    .padding(EdgeInsets.init(top: 8, leading: 10, bottom: 8, trailing: 10))
    .swipeActions {
      if item.id != nil {
        deleteButton(item.id!)
      }

    }
  }
}
