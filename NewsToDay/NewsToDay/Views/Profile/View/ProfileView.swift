//
//  ProfileView.swift
//  NewsToDay
//
//  Created by Serge Eliseev on 23.10.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("ICON2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 72, height: 72)
                        .clipShape(Circle())
                    
                    VStack {
                        Text("Dev P")
                            .foregroundStyle(.blackDark)
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.horizontal, 15)
                        
                        Text("devgmail.com")
                            .foregroundStyle(.greyLight)
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 2)
                            .padding(.horizontal, 15)
                    }
                }
                .padding(.top, 120)
                .padding(.vertical, 40)

                NavigationLink(destination: Text("Next View Language")) {
                    HStack {
                        Text("Language")
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .padding(.leading, 25)
                            .padding(5)
                            .foregroundStyle(.blackLight)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.greyDark)
                            .padding(.trailing, 25)
                    }
                    .background(.greyLighter)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Spacer()

                NavigationLink(destination: Text("Next View Terms & Conditions")) {
                    HStack {
                        Text("Terms & Conditions")
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .padding(.leading, 25)
                            .padding(5)
                            .foregroundStyle(.blackLight)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.greyDark)
                            .padding(.trailing, 25)
                    }
                    .background(.greyLighter) // Замените на ваш цвет
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }

                NavigationLink(destination: Text("Sign Out")) {
                    HStack {
                        Text("Sign Out")
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .padding(.leading, 25)
                            .padding(5)
                            .foregroundStyle(.blackLight)

                        Spacer()

                        Image("LogOut")
                            .foregroundColor(.greyDark)
                            .padding(.trailing, 25)
                    }
                    .background(.greyLighter)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding(.vertical, 20)
                
                HStack {
                    NavigationLink(destination: Text("Next View")) {
                        Image("Home")

                    }
                    .padding(35)
                    
                    NavigationLink(destination: Text("Next View")) {
                        Image("Categories")
                    }
                    .padding(35)
                    
                    NavigationLink(destination: Text("Next View")) {
                        Image("Bookmarks")
                    }
                    .padding(35)
                    
                    NavigationLink(destination: Text("Next View")) {
                        Image("Profile")
                    }
                    .padding(35)
                }
                .background(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
            .navigationTitle("Profile")
            .ignoresSafeArea()
            }
        
        }
    }


#Preview {
    ProfileView()
}
