//
//  ContentView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) var viewContext
  @State var isShowingListModal = false
  
  var body: some View {
    NavigationView {
      ReminderListView()
      .navigationBarTitle(Text("Reminders"))
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button (
          action: { self.isShowingListModal.toggle() },
          label: { Image(systemName: "plus") }
        ).sheet(isPresented: $isShowingListModal, content: {
          ReminderListCreateView().environment(\.managedObjectContext, self.viewContext)
        })
      )
    }
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
