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
  @FetchRequest(sortDescriptors: []) var reminderLists: FetchedResults<ReminderList>
  
  var body: some View {
    VStack {
      List {
        Section {
          ForEach(reminderLists, id:\.self) { reminderList in
            NavigationLink(destination: RemindersView( reminderList: reminderList)) {
              CircularImageView(color: Color.random)
              Text(reminderList.title ?? "...")
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
