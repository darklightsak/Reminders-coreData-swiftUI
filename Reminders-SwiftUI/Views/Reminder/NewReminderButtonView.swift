//
//  NewReminderButtonView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct NewReminderButtonView: View {
  @Binding var isShowingCreateModal: Bool
  
  var body: some View {
    Button(action: { self.isShowingCreateModal.toggle() }) {
      Image(systemName: "plus.circle.fill")
        .foregroundColor(.red)
      Text("New Reminder")
        .font(.headline)
        .foregroundColor(.red)
    }.sheet(isPresented: $isShowingCreateModal) {
      CreateReminderView()
    }
  }
}

struct NewReminderButtonView_Previews: PreviewProvider {
  static var previews: some View {
    NewReminderButtonView(isShowingCreateModal: .constant(false))
  }
}
