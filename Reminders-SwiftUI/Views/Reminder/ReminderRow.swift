//
//  ReminderRow.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct ReminderRow: View {
  @State var isCompleted: Bool = false
  
  var body: some View {
    HStack {
      Button(action: {
        self.isCompleted.toggle()
      }) {
        ReminderStatusView(isChecked: $isCompleted)
      }
      Text("Placeholder")
      Spacer()
    }
  }
}

struct ReminderRow_Previews: PreviewProvider {
  static var previews: some View {
    return ReminderRow()
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
