//
//  NewReminderButtonView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct NewReminderButtonView: View {
  @Binding var isShowingCreateModal: Bool
  @Environment(\.managedObjectContext) var viewContext
  
  var body: some View {
    Button(action: { self.isShowingCreateModal.toggle() }) {
      Image(systemName: "plus.circle.fill")
        .foregroundColor(.red)
      Text("New Reminder")
        .font(.headline)
        .foregroundColor(.red)
    }.sheet(isPresented: $isShowingCreateModal) {
      CreateReminderView()
        .environment(\.managedObjectContext, self.viewContext)
    }
  }
}

struct NewReminderButtonView_Previews: PreviewProvider {
  static var previews: some View {
    NewReminderButtonView(isShowingCreateModal: .constant(false))
  }
}
