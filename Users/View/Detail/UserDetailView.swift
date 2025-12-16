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
        NavigationStack {
            VStack {
                ProfilePicture(
                    url: viewModel.userDetail?.avatarURL
                )
                HStack(spacing: 8) {
                    Text(viewModel.userDetail?.firstName ?? "FirstName")
                        .font(.largeTitle).bold().foregroundColor(Color.white)
                    Text(viewModel.userDetail?.lastName ?? "LastName")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                if let detail = viewModel.userDetail {
                    UserProfileForm(
                        username: detail.username,
                        email: detail.email,
                        nickname: detail.nickname,
                        birthday: detail.birthDate,
                        status: detail.status,
                        gender: detail.gender
                    ).disabled(true)
                } else {
                    ProgressView()
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Editar") {
                        // Acción de edición
                    }
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
}

#Preview {
    NavigationStack {
        UserDetailView(
            user: User(
                id: UUID(uuidString: "b9c7f4e2-1a23-4bcd-9f01-23456789abcd") ?? UUID(),
                firstName: "Ada",
                avatarURL: URL(string: "https://avatar.iran.liara.run/public"),
                status: "ACTIVE"
            )
        )
    }
}
