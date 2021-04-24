//
//  ReminderView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct RemindersView: View {
  @State var isShowingCreateModal: Bool = false
  
  var body: some View {
    VStack {
      List {
        Section {
          ForEach(1...10, id: \.self) { _ in
            Text("Test")
          }
        }
      }
      .background(Color.white)
      HStack {
        NewReminderButtonView(isShowingCreateModal: $isShowingCreateModal)
        Spacer()
      }
      .padding(.leading)
    }
    .navigationBarTitle(Text("Reminders"))
  }
}

struct RemindersView_Previews: PreviewProvider {
  static var previews: some View {
    RemindersView()
  }
}
