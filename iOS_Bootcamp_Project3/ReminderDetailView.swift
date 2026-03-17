//
//  ReminderDetailView.swift
//  iOS_Bootcamp_Project3
//
//  Created by Siyu Liu on 3/15/26.
//

import SwiftUI

struct ReminderDetailView: View {
        // TODO: Fill in necessary bindings (Hint: you need 4)
    @Binding var isEditing: Bool
    @Binding var title: String
    @Binding var selectedColor: Color
    @Binding var description: String
    @Binding var date: Date
    
    var body: some View {
                    // TODO: Recreate the view in the write-up video
        NavigationStack{
            Text(description)
                .padding(50)
                .frame(width:345, alignment:.center)
                .font(.system(size:20))
            
            List{
                //Title + Description section
                Section {
                    HStack{
                        Text("Title")
                        TextField("Title",text: $title)
                    }
                    .frame(width:330)
                    HStack{
                        Text("Description")
                        TextField("Description",text: $description)
                    }
                    .frame(width:330)
                } header: {
                    Text("Title & Description")
                        .foregroundStyle(selectedColor)
                        .font(.system(size:18,weight:.bold))
                }
                
                //Date Section
                Section {
                    DatePicker("Date",selection: $date)
                } header: {
                    Text("Date")
                        .foregroundStyle(selectedColor)
                        .font(.system(size:18,weight:.bold))
                }
            }
        }
                // TODO: Add Toolbar for Todo Info
        .sheet(isPresented: $isEditing) {
            EditSheet(title: $title,selectedColor: $selectedColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
                //TODO: Add NavigationTitle
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {isEditing.toggle()}) {
                    Image(systemName:"info.circle")
                        .font(.system(size:20))
                        .foregroundStyle(selectedColor)
                }
            }  
        }
    }
        
}

#Preview {
    // TODO: Create necessary @State properties to pass into preview (Hint: use @Previewable)
    @Previewable @State var isEditing: Bool = true
    @Previewable @State /*private*/ var selectedColor: Color = .red
    
    @Previewable @State var title: String = "Homework"
    @Previewable @State var description: String = "Finish the homework"
    @Previewable @State var date1: Date = Date(/*month:"Jan",day:18,year: 2026, hour:10, minute:42, time_of_day: "PM"*/)
    
    NavigationStack {
        ReminderDetailView(isEditing: $isEditing, title: $title, selectedColor: $selectedColor, description: $description, date: $date1)
    }
}
