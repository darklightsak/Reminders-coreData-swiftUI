//
//  ReminderListView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 12/5/2564 BE.
//

import SwiftUI

extension Color {
  static var random: Color {
    return Color(red: Double.random(in: 0...1),
                 green: Double.random(in: 0...1),
                 blue: Double.random(in: 0...1))
  }
}

struct ReminderListView: View {
  @Environment(\.managedObjectContext) var viewContext
  
  var body: some View {
    VStack {
      List {
        Section {
          ForEach(1...10, id:\.self) { _ in
            HStack {
              CircularImageView(color: Color.random)
              Text("ReminderList")
            }
          }
        }
      }
      .listStyle(GroupedListStyle())
    }
  }
}

struct ReminderListView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListView()
    }
}
