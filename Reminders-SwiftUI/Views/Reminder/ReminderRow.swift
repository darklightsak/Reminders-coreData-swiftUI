//
//  ReminderRow.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct ReminderRow: View {
  let reminder: Reminder
  @State var isCompleted: Bool = false
    
  private var priority: String {
    ReminderPriority(rawValue: reminder.priority)?.shortDisplay ?? ""
  }
  
  var body: some View {
    HStack {
      Button(action: {
        self.isCompleted.toggle()
        self.reminder.isCompleted = self.isCompleted
      }) {
        ReminderStatusView(isChecked: $isCompleted)
      }
      Text("\(priority) \(reminder.title)")
      Spacer()
    }
  }
}

struct ReminderRow_Previews: PreviewProvider {
  static var previews: some View {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    let newReminder = Reminder(context: context)
    newReminder.title = "Some task"
    return ReminderRow(reminder: newReminder)
      .environment(\.managedObjectContext, context)
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
