//
//  EditSheet.swift
//  iOS_Bootcamp_Project3
//
//  Created by Siyu Liu on 2/25/26.
//

import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var title: String
    @Binding var selectedColor: Color
    
    
    var body: some View {
        VStack(spacing: 40) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            Text("List Info")
                .font(.system(size: 30, weight:.bold, design: .rounded))
            
            VStack{
                Image(systemName:"list.bullet.circle.fill")
                    .resizable()
                    .frame(width:50,height:50)
                TextField("List Name", text: $title)
                    .textFieldStyle(.roundedBorder)
                   //.background(Color(red: 159/255, green: 169/255, blue: 163/255))
                    .frame(width:300, height:100)
            }
            .background(RoundedRectangle(cornerRadius:16)
                .fill(Color.secondary.opacity(0.15))
                .frame(width:340,height:200))

            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding(10)
    }
}

#Preview {
    @Previewable @State /*private*/ var selectedColor: Color = .red
    
    @Previewable @State var title: String = "Homework"
    
    EditSheet(title: $title,selectedColor: $selectedColor)
        //.preferredColorScheme(.white)
}
