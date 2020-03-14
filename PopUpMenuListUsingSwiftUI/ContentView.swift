//
//  ContentView.swift
//  PopUpMenuListUsingSwiftUI
//
//  Created by Ramill Ibragimov on 14.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                ZStack(alignment: .bottomTrailing) {
                    NavigationView {
                        List(0..<5, id: \.self) { _ in
                            HStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("Sanna")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                        }.navigationBarTitle("Home")
                    }
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image(systemName: "message.fill")
                            .foregroundColor(.white)
                            .padding(20)
                    }.background(Color.purple)
                    .clipShape(Circle())
                    .padding()
                }
            }.opacity(self.show ? 0 : 1)
            
            if self.show {
                GeometryReader { _ in
                    VStack {
                        PopList()
                        
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(20)
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.top, 25)
                    }
                }.background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PopList: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0..<25, id: \.self) { _ in
                    ZStack(alignment: .trailing) {
                        HStack {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Sandra")
                                    .fontWeight(.semibold)
                                
                                Text("SwiftUI is awesome!")
                                    .font(.caption)
                                    .padding(.top, 8)
                                
                                Divider()
                            }
                        }
                        Image(systemName: "arrow.right")
                            .foregroundColor(.gray)
                    }
                }
            }.padding()
        }.background(Color.white)
        .frame(width: UIScreen.main.bounds.width - 80,
               height: UIScreen.main.bounds.height - 250)
        .cornerRadius(8)
    }
}
