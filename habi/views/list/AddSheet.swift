//
//  AddSheet.swift
//  habi
//
//  Created by war on 2025-07-31.
//

import CoreData
import SwiftUI

struct AddSheet: View {
  @EnvironmentObject var manager: HabiManager
  @Binding var showingSheet: Bool
  @State private var inputText = ""
  @State private var selectedColor: Color = .accentColor
  @State private var selectedIcon: String = "face.smiling"

  let icons: [String] = [
    "face.smiling", "list.bullet", "bookmark.fill", "books.vertical.fill", "gift.fill",
    "graduationcap.fill",
    "doc.fill",
    "creditcard.fill",
    "fork.knife", "pills.fill", "stethoscope", "house.fill", "building.2.fill",
    "building.columns", "tv",
    "headphones", "leaf.fill", "figure.stand", "pawprint.fill", "cart.fill",
    "bag.fill", "shippingbox.fill", "tram.fill", "snowflake", "briefcase.fill",
    "wrench.and.screwdriver.fill", "scissors", "curlybraces", "lightbulb.fill",
    "bubble.fill", "asterisk", "stop.fill",
    "triangle.fill", "diamond.fill", "heart.fill", "star.fill", "person.3.fill",
    "guitars", "paintpalette.fill", "flame", "sunrise.fill", "sunset.fill",
    "globe.europe.africa.fill", "pencil", "bicycle",
  ]

  func addItem() {
    manager.addItem(name: inputText, iconName: selectedIcon)
    inputText = ""
    showingSheet.toggle()
  }

  var closeButton: some View {
    Button(action: { showingSheet.toggle() }, label: { Image(systemName: "xmark") })
  }

  var titleView: some View {
    Text("Add Focus")
      .font(.title2).bold()
      .padding(.top, 16)
  }

  var iconView: some View {
    ZStack {
      Circle()
        .fill(selectedColor)
        .frame(width: 100, height: 100)
      Image(systemName: selectedIcon)
        .resizable()
        .scaledToFit()
        .frame(width: 56, height: 56)
        .foregroundColor(.white)
    }
    .padding(.top, 8)
  }

  var nameInputView: some View {
    TextField("Name", text: $inputText)
      .padding()
      .background(Color(.systemGray).opacity(0.1))
      .cornerRadius(12)
      .fontWeight(.bold)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
  }

  func iconGridItemView(icon: String) -> some View {
    ZStack {
      ZStack {
        Circle()
          .fill((selectedIcon == icon ? selectedColor : Color(.systemGray)).opacity(0.3))
          .frame(width: 45, height: 45)
        Image(systemName: icon)
          .resizable()
          .foregroundColor(selectedIcon == icon ? selectedColor : nil)
          .scaledToFit()
          .fontWeight(.bold)
          .opacity(selectedIcon == icon ? 1 : 0.5)
          .frame(width: 24, height: 24)
      }
      Circle()
        .stroke(selectedColor.opacity(selectedIcon == icon ? 1 : 0), lineWidth: 2.5)
        .frame(width: 55, height: 55)
    }
  }

  var iconGridView: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVGrid(
        columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 6), spacing: 16
      ) {
        ForEach(icons, id: \.self) { icon in
          iconGridItemView(icon: icon)
            .onTapGesture { selectedIcon = icon }
        }
      }
      .padding(.top, 10)
      .padding(.bottom, 120)
      .padding(.horizontal)
    }
    .frame(maxHeight: .infinity)
    .layoutPriority(1)
  }

  var createView: some View {
    Button(action: { addItem() }) {
      Text("Create")
        .frame(maxWidth: .infinity)
        .padding()
        .background(inputText.isEmpty ? Color.gray : selectedColor)
        .foregroundColor(.white)
        .cornerRadius(24)
        .font(.headline)
    }
    .disabled(inputText.isEmpty)
    .padding(.horizontal)
    .padding(.bottom, 50)
  }

  var blurredCreateView: some View {
    ZStack(alignment: .bottom) {
      Rectangle()
        .fill(.ultraThinMaterial)
        .blur(radius: 10)
      VStack {
        Spacer()
        createView
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 120, alignment: .bottom)
    .padding(.bottom, 0)
  }

  var body: some View {
    NavigationStack {

      VStack(spacing: 24) {

        titleView
        iconView
        nameInputView

        ZStack(alignment: .bottom) {
          iconGridView
          blurredCreateView
        }

      }.ignoresSafeArea(.container, edges: .bottom)

        .toolbar {
          closeButton
        }
    }
  }
}
