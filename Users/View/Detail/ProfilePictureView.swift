//
//  ProfilePicture.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 09-12-25.
//

import SwiftUI

struct ProfilePicture: View{
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    var body: some View {
        VStack{
            AsyncImage(url: self.url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 200, height: 200)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                        .shadow(radius: 5)
                case .failure:
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray.opacity(0.5))
                @unknown default:
                    EmptyView()
                        .frame(width: 120, height: 120)
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.top, 8)
        }
    }
}
