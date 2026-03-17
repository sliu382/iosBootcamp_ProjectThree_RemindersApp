//
//  ContentView.swift
//  iOS_Bootcamp_Project3
//
//  Created by Siyu Liu on 2/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    
    @State private var page: RemindersPage = RemindersPage(title:"List Name",items: [], color: .blue)
    
    var body: some View {
            
            NavigationStack{
                VStack {
                    // TODO: Add header view
                    HStack{
                        Text(page.title)
                            .font(.system(size: 40, design: .rounded))
                        Spacer()
                    }
                    .foregroundStyle(page.color)
                    .padding(30)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                isEditing.toggle()
                            } label: {
                                Image(systemName: "info.circle")
                                    .font(.system(size:20))
                                    .foregroundStyle(page.color)
                            }
                        }
                    }.frame(height:30)
                
                List {
                    // TODO: Loop through the page's reminders using ForEach
                    ForEach( $page.items) { $reminder in
                        // TODO: Display each reminder row
                        HStack {
                            Button {
                                reminder.isCompleted.toggle()
                            } label: {
                                Image(systemName: reminder.isCompleted ? "circle.fill" :"circle")
                                    .foregroundStyle(page.color)
                            }
                            //Separates button from Navigation link
                            .buttonStyle(.borderless)
                            TextField("Title",text: $reminder.title)
                                .foregroundStyle(reminder.isCompleted ? .gray:.black)
                            
                            //Link to each reminder
                            NavigationLink{
                                ReminderDetailView(isEditing: $isEditing,title: $reminder.title,selectedColor: $page.color,description: $reminder.description,date:$reminder.date)
                            } label: {
                                Text(reminder.date, style:.relative)
                            }
                            
                        }
                        .alignmentGuide(.listRowSeparatorLeading){_ in 0}
                        
                    }
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
                .padding(.horizontal, 15)
                .font(.system(size: 20))
                
                
                    
                    
                // TODO: Add footer view
                HStack{
                    Spacer()
                    Button {
                        page.items.append(Reminder(title: "", description:"",date: Date(),isCompleted: false))
                    } label : {
                        Image(systemName:"plus.circle.fill")
                            .foregroundStyle(page.color)
                                .font(.system(size:35))
                    }
                }
                .padding(.trailing,20)
            }
                
        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color/* page color */)
                .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
