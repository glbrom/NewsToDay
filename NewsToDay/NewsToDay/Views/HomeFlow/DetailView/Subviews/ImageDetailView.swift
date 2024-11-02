//
//  DetailViews.swift
//  NewsToDay
//
//  Created by Roman Golub on 01.11.2024.
//

import SwiftUI

struct ImageDetailView: View {
    
    var article: SearchArticle
    
    var body: some View {
        GeometryReader { geometry in
            let imageHeight = geometry.frame(in: .global).minY + SizeImageConstants.avatarHeight + 10
            let imageOffset = -geometry.frame(in: .global).minY
            
            Group {
                if let url = URL(string: article.urlToImage ?? "") {
                    AsyncImage(url: url) { img in
                        img
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .applyGradient()
                    } placeholder: {
                        DefaultImageView()
                    }
                } else {
                    DefaultImageView()
                }
            }
            .offset(y: imageOffset)
            .frame(width: SizeImageConstants.screenWidth, height: imageHeight)
        }
        .frame(height: SizeImageConstants.avatarHeight)
    }
}

struct SizeImageConstants {
    static var avatarHeight: CGFloat {
        UIScreen.main.bounds.height / 3
    }
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

#Preview {
    ImageDetailView(article: SearchArticle.previewItem)
}
