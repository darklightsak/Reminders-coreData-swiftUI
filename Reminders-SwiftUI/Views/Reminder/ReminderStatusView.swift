//
//  ReminderStatusView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct ReminderStatusView: View {
  @Binding var isChecked: Bool
    
  var body: some View {
    Circle()
      .padding(4)
      .overlay(
        Circle()
          .stroke(Color.red, lineWidth: 2)
      )
      .foregroundColor(isChecked ? .red : .clear)
      .frame(width:20, height: 20)
  }
}

struct ReminderStatusView_Previews: PreviewProvider {
  static var previews: some View {
    ReminderStatusView(isChecked: .constant(true)).previewLayout(.fixed(width: 300, height: 70))
  }
}

