//
//  Test.swift
//  iOS_Bootcamp_Project3
//
//  Created by Siyu Liu on 3/16/26.
//

import SwiftUI

struct Test: View {
    let test_list = ["Hello", "World", "This", "Is", "A", "Test"]
    var body: some View {
        List{
            ForEach(test_list, id:\.self){word in
                Text(word)
            }
        }
        
        List{
            Section("Animals") {
                HStack{
                    Text("Dog")
                    Text("Cat")
                }
                HStack{
                    Text("Hmm")
                }
            }
            
            Section("Fruits") {
                Text("Apple")
                Text("Fruit")
            }
        }
    }
}

#Preview {
    Test()
}
