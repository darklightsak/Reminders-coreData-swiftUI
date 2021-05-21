//
//  ReminderListCreateView.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 12/5/2564 BE.
//

import SwiftUI

struct ReminderListCreateView: View {
  @Environment(\.managedObjectContext) var viewContext
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  @State var text: String = ""
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        HStack {
          Spacer()
          CircularImageView(color: .red)
          Spacer()
        }
        .padding([.top, .bottom])
        HStack {
          Text("Enter a list title")
          Spacer()
        }
        .padding([.leading, .trailing])
        TextField("Title", text: $text)
          .padding()
          .background(
            Color(red: 231/255.0, green: 234/255.0, blue: 237/255.0)
          )
          .cornerRadius(10)
          .padding()
        Spacer()
      }
      .navigationBarTitle(Text("Create List"), displayMode: .inline)
      .navigationBarItems(
        leading: Button("Close") {
          self.presentationMode.wrappedValue.dismiss()
        },
        trailing: Button("Save") {
          if !self.text.isEmpty {
            ReminderList.create(withTitle: self.text, in: self.viewContext)
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      )
    }
  }
}

struct ReminderListCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListCreateView()
    }
}
