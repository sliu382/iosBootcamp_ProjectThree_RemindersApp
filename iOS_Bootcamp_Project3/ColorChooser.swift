//
//  ColorChooser.swift
//  iOS_Bootcamp_Project3
//
//  Created by Siyu Liu on 2/25/26.
//

import SwiftUI

struct ColorChooser: View {
    @Binding var selectedColor: Color
    
    var colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    let columns = [ GridItem(.adaptive(minimum: 50)) ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(colors, id: \.self) { color in
                Button {
                    selectedColor = color
                } label: {
                    color
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(selectedColor == color ? Color.white : Color.clear, lineWidth: 3)
                        )
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))
    }
}

//#Preview {
//    //@State var selectedColor: Color = .red
//    ColorChooser()
//}
