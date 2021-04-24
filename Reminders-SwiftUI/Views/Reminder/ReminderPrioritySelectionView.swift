//
//  ReminderPrioritySelectionView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct ReminderPrioritySelectionView: View {
  @Binding var priority: ReminderPriority
  @State var selections = Array(repeating: false, count: ReminderPriority.allCases.count)
  
  var body: some View {
    List {
      ForEach(0..<ReminderPriority.allCases.count) { index in
        Button(action: {
          self.priority = ReminderPriority.allCases[index]
          self.selections = Array(repeating: false, count: ReminderPriority.allCases.count)
          self.selections[index] = true
        }) {
          HStack {
            Text(ReminderPriority.allCases[index].fullDisplay)
              .foregroundColor(.black)
            Spacer()
            
            if self.selections[index] == true {
              Image(systemName: "checkmark")
            }
          }
        }
      }
    }
  }
}

struct ReminderPrioritySelectionView_Previews: PreviewProvider {
  static var previews: some View {
    ReminderPrioritySelectionView(priority: .constant(.none))
  }
}
