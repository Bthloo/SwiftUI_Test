//
//  ContentView.swift
//  SwiftUI_Test
//
//  Created by Bthloo on 03/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [
        User(name: "Bassel", age: 22),
        User(name: "Mohamed", age: 20),
        User(name: "Ahmed", age: 16),
        User(name: "Tarek", age: 22)
    ]
    
    var body: some View {
        VStack {
           
            Text("Users List")
                .font(.title)
            UsersList(users: $users)
            Button("Add User") {
                users.append(User(name: "Alaa", age: 51))
            }.buttonStyle(.bordered)
        }
    }
}

struct UsersList: View {
    @Binding var users: [User]
    
    var body: some View {
        List {
            ForEach(users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text("Age: \(user.age)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        deleteUser(user: user)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    
                    Button {
                        editUser(user: user)
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.blue)
                }
            }
        }.listStyle(PlainListStyle())
    }
    
    // Delete function
    func deleteUser(user: User) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users.remove(at: index)
        }
    }
    
    // Edit function
    func editUser(user: User) {
        // Add your edit functionality here
        print("Editing user: \(user.name)")
    }
}

struct User: Identifiable {
    let name: String
    let age: Int
    let id = UUID()
}

#Preview {
    ContentView()
}
