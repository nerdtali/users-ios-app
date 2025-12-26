//
//  UserListView.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//
import SwiftUI

struct UserListView: View {
    
    @State private var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Usuarios")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(.label))
                    Spacer()
                }.padding(20)
                
                List {
                    ForEach(viewModel.userList, id: \.id) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            HStack(spacing: 12) {
                                Text(user.firstName)
                                    .font(.title.weight(.light))
                                    .padding(.vertical, 2)
                                
                                Spacer()
                                
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(self.color(for: user.status))
                                    .font(.title.weight(.light))
                            }
                            .padding(.vertical, 3)
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .task {
                    do {
                        try await viewModel.fetchUserList()
                    } catch {
                        print(error)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .background(Color.teal)
        }
    }
    
    private func color(for status: String) -> Color {
        switch status.uppercased() {
        case "ACTIVE":
            return .green
        case "INACTIVE":
            return .red
        default:
            return .gray
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
