//
//  UserProfileForm.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 10-12-25.
//

import SwiftUI

struct UserProfileForm: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var nickname: String = ""
    @State private var birthday: Date = .now
    @State private var status: String = ""
    @State private var gender: String = ""
    @State private var isEditing: Bool = false

    init(
        username: String = "",
        email: String = "",
        nickname: String = "",
        birthday: Date = .now,
        status: String = "",
        gender: String =  ""
    ) {
        _username = State(initialValue: username)
        _email = State(initialValue: email)
        _nickname = State(initialValue: nickname)
        _birthday = State(initialValue: birthday)
        _status = State(initialValue: status)
        _gender = State(initialValue: gender)
    }

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                LabeledContent("Usuario") {
                    TextField("Username", text: $username)
                        .textContentType(.username)
                        .autocapitalization(.none)
                        .multilineTextAlignment(.trailing)
                }

                LabeledContent("Email") {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .multilineTextAlignment(.trailing)
                }

                LabeledContent("Apodo") {
                    TextField("Nickname", text: $nickname)
                        .multilineTextAlignment(.trailing)
                }
                
                LabeledContent("Estado") {
                    TextField("Status", text: $status)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color.green)
                }

                DatePicker("Fecha de Nacimiento",
                           selection: $birthday,
                           displayedComponents: .date)
                
                LabeledContent("Género") {
                    TextField("Gender", text: $gender)
                        .multilineTextAlignment(.trailing)
                }
            }

            Section {
                Button("Save Profile") {
                    // Implement save functionality here
                    print("Saving profile for: \(username)")
                }
            }
        }
    }
}

struct UserProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDate = Calendar.current.date(from: DateComponents(year: 1990, month: 12, day: 12)) ?? .now

        return UserProfileForm(
            username: "userNames",
            email: "a@a.cl",
            nickname: "nick",
            birthday: sampleDate,
            status: "ACTIVE",
            gender: "MALE"
        )
    }
}
