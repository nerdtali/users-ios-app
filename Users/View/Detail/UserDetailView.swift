//
//  UserDetailView.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 09-12-25.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = UserDetailViewModel()
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0){
                HStack (alignment: .top){
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .padding(.horizontal)
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                  
                    VStack{
                        ProfilePicture(
                            url: viewModel.userDetail?.avatarURL
                        )
                        HStack(spacing: 8) {
                            Text(viewModel.userDetail?.firstName ?? "FirstName")
                                .font(.largeTitle).bold()
                            Text(viewModel.userDetail?.lastName ?? "LastName")
                                .font(.largeTitle).bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }.offset(y: -250)
                }
                .padding(15)
            }
        }
        .background(Color.teal)
        .task {
            do {
                try await viewModel.fetchUserDetail(id: user.id)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    UserDetailView(
        user: User(
            id: UUID(uuidString: "b9c7f4e2-1a23-4bcd-9f01-23456789abcd") ?? UUID(),
            firstName: "Ada",
            avatarURL: URL(string: "https://avatar.iran.liara.run/public"),
            status: "ACTIVE"
        )
    )
}
