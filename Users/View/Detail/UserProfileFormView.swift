//
//  UserProfileForm.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 10-12-25.
//

import SwiftUI

struct UserProfileFormView: View {
    @Environment(\.dismiss) private var dismiss
    
    private let userId: UUID
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var nickname: String = ""
    @State private var birthday: Date = .now
    @State private var status: String = ""
    @State private var gender: String = ""
    @State private var showDeleteSuccess: Bool = false
    @State private var deleteErrorMessage: String?
    
    @Binding private var isEditing: Bool
    @State private var viewModel = UserDeleteViewModel()
    
    let defaultStatus = ["ACTIVE", "INACTIVE", "BANNED"]
    let defaultGender = ["MALE", "FEMALE", "OTHER"]

    init(
        userId: UUID,
        firstName: String = "",
        lastName: String = "",
        username: String = "",
        email: String = "",
        nickname: String = "",
        birthday: Date = .now,
        status: String = "",
        gender: String =  "",
        isEditing: Binding<Bool>
    ) {
        self.userId = userId
        _firstName = State(initialValue: firstName)
        _lastName = State(initialValue: lastName)
        _username = State(initialValue: username)
        _email = State(initialValue: email)
        _nickname = State(initialValue: nickname)
        _birthday = State(initialValue: birthday)
        _status = State(initialValue: status)
        _gender = State(initialValue: gender)
        _isEditing = isEditing
    }

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                
                if isEditing {
                    LabeledContent("Nombre") {
                        TextField("FirstName", text: $firstName)
                            .textContentType(.username)
                            .autocapitalization(.none)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    LabeledContent("Apellido") {
                        TextField("LastName", text: $lastName)
                            .textContentType(.username)
                            .autocapitalization(.none)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
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
                
                Picker("Estado", selection: $status) {
                    ForEach(defaultStatus, id: \.self) { status in
                        Text(status)
                            .tag(status)
                    }
                }

                DatePicker("Fecha de Nacimiento",
                           selection: $birthday,
                           displayedComponents: .date)
                
                Picker("Genero", selection: $gender) {
                    ForEach(defaultGender, id: \.self) { gender in
                        Text(gender)
                            .tag(gender)
                    }
                }
            }

            if isEditing {
                Section {
                    Button("Actualizar datos") {
                        // Implementa guardado aquí (llamada a ViewModel/UseCase).
                        // Al terminar, puedes salir del modo edición:
                        isEditing = false
                        print("Saving profile for: \(username)")
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section {
                    Button("Eliminar") {
                        Task {
                            do {
                                try await viewModel.fetchUserdelete(userId: userId)
                                // Si no lanza error, asumimos que el backend devolvió 204.
                                showDeleteSuccess = true
                            } catch {
                                deleteErrorMessage = error.localizedDescription
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.red)
                }
            }
        }
        .disabled(!isEditing)
        .alert("Eliminado correctamente", isPresented: $showDeleteSuccess) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("El usuario ha sido eliminado.")
        }
        // Opcional: mostrar error si falla
        .alert("Error al eliminar", isPresented: .constant(deleteErrorMessage != nil)) {
            Button("OK") { deleteErrorMessage = nil }
        } message: {
            Text(deleteErrorMessage ?? "Error desconocido")
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

struct UserProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDate = Calendar.current.date(from: DateComponents(year: 1990, month: 12, day: 12)) ?? .now

        return UserProfileFormView(
            userId: UUID(),
            username: "userNames",
            email: "a@a.cl",
            nickname: "nick",
            birthday: sampleDate,
            status: "ACTIVE",
            gender: "MALE",
            isEditing: .constant(true)
        )
    }
}

