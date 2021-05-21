//
//  ReminderView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct RemindersView: View {
  @State var isShowingCreateModal: Bool = false
  var fetchRequest: FetchRequest<Reminder>
  var reminders: FetchedResults<Reminder> { return fetchRequest.wrappedValue }
  
  let reminderList: ReminderList
  
  var body: some View {
    VStack {
      List {
        Section {
          ForEach(reminders, id: \.self) { reminder in
            ReminderRow(reminder: reminder)
          }
        }
      }
      .background(Color.white)
      HStack {
        NewReminderButtonView(isShowingCreateModal: $isShowingCreateModal, reminderList: reminderList)
        Spacer()
      }
      .padding(.leading)
    }
    .navigationBarTitle(Text("Reminders"))
  }
  
  init(reminderList: ReminderList) {
    self.reminderList = reminderList
    self.fetchRequest = Reminder.reminders(in: reminderList)
  }
}

struct RemindersView_Previews: PreviewProvider {
  static var previews: some View {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    let newReminderList = ReminderList(context: context)
    newReminderList.title = "Preview List"
    return RemindersView(reminderList: newReminderList).environment(\.managedObjectContext, context)
  }
}
