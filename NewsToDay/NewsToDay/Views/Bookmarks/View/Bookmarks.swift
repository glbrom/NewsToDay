//
//  Bookmarks.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//



import SwiftUI

struct Bookmarks: View {
    @State var selectedTab = 3
    @State var isActive: Bool = false
    var boookMarktext: String = "Bookmarks"
    var article: String = "Saved articles to the library"
    var bullet: String = "UI/UX Design"
    var topic : String = "A Simple Trick For Creating \nColor Palettes Quickly"
    var topic2 : String = "Six steps to creating a color\n "
    var topic3 : String = "Creating Color Palette from world around you"
    var bullet3: String = "Colors"
    var bullet2: String = "Art"
    var lastTopic: String = "A Simple Trick For Creating Color Palettes Quickly"
    var body: some View {
        VStack {
          
            Text(boookMarktext)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.trailing,200)

           
            Text(article)
                .font(.subheadline)
                .foregroundColor(.greyPrimary)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.trailing, 155)

           
            VStack(spacing: 20) {
                
                HStack {
                    Image("city")
                        .resizable()
                        .frame(width: 96, height: 96)
                        .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(bullet)
                            .font(.caption)
                            .foregroundColor(.greyPrimary)
                            .padding(.bottom, 2)
                        Text(topic)
                            .font(.body)
                    }
                    .padding(.leading, 5)
                }

               
                HStack {
                    Image("city")
                        .resizable()
                        .frame(width: 96, height: 96)
                        .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(bullet2)
                            .font(.caption)
                            .foregroundColor(.greyPrimary)
                            .padding(.bottom, 2)
                        Text(topic2)
                            .font(.body)
                            .padding(.trailing,80)
                    }
                    .padding(.leading, 5)
                }

              
                HStack {
                    Image("city")
                        .resizable()
                        .frame(width: 96, height: 96)
                        .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(bullet3)
                            .font(.caption)
                            .foregroundColor(.greyPrimary)
                            .padding(.bottom, 2)
                        Text(topic)
                            .font(.body)
                            .lineLimit(2)
                    }
                    .padding(.leading, 10)
                }
                
                
                 HStack {
                     Image("city")
                         .resizable()
                         .frame(width: 96, height: 96)
                         .cornerRadius(8)

                     VStack(alignment: .leading) {
                         Text(bullet2)
                             .font(.caption)
                             .foregroundColor(.greyPrimary)
                             .padding(.bottom, 2)
                         Text(lastTopic)
                             .font(.body)
                             .padding(.trailing,80)
                     }
                     .padding(.leading, 10)
                 }
            }
            .padding()

            Spacer()

            
            TabView(selection: $selectedTab) {
                Text("")
                    .tabItem {
                                ZStack {
                                          Constants.Icons.home
                                              .resizable()
                                              .frame(width: 24, height: 24)
                                          RoundedRectangle(cornerRadius: 10)
                                             
                                      }
                                  }
                              .tag(1)

                          Text("")
                              .tabItem {
                                  Constants.Icons.categories
                                      .renderingMode(.template)
                                      .foregroundColor(selectedTab == 2 ? Constants.Colors.purplePrimary : .gray)
                                      
                              }
                              .tag(2)

                          Text("")
                              .tabItem {
                                  Constants.Icons.bookmark
                                      .renderingMode(.template)
                                      .foregroundColor(selectedTab == 3 ? Constants.Colors.purplePrimary : .gray)
                              }
                              .tag(3)

                          Text("")
                              .tabItem {
                                  Constants.Icons.profile
                                      .renderingMode(.template)
                                      .foregroundColor(selectedTab == 4 ? Constants.Colors.purplePrimary : .gray)
                              }
                              .tag(4)
            }
            .frame(width: 375, height: 60)
            .shadow(color: .greyPrimary.opacity(0.30), radius: 80, x: 0, y: -2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    Bookmarks()
}
