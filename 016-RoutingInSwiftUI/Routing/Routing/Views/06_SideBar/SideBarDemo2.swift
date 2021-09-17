//
//  SideBarDemo2.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/16/21.
//

import SwiftUI

struct SideBarDemo2: View {
    @StateObject var store = MailStore()
    @State private var selectedLabel: String? = "Inbox"
    @State private var selectedMail: Mail?
    
    var body: some View {
        NavigationView {
            Sidebar(
                store: store,
                selectedFolder: $selectedLabel,
                selectedMail: $selectedMail
            )
        }
    }
}

struct SideBarDemo2_Previews: PreviewProvider {
    static var previews: some View {
        SideBarDemo2()
.previewInterfaceOrientation(.portrait)
    }
}

// Model
struct Mail: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let subject: String
    let body: String
    var isFavorited = false
}

final class MailStore: ObservableObject {
    @Published var allMails: [String: [Mail]] = [
        "Inbox": [ .init(date: Date(), subject: "Subject1.1", body: "Very long body..."),
                   .init(date: Date(), subject: "Subject1.2", body: "Very long body..."),
                   .init(date: Date(), subject: "Subject1.3", body: "Very long body..."),
                   .init(date: Date(), subject: "Subject1.4", body: "Very long body...") ],
        "Sent": [ .init(date: Date(), subject: "Subject2.1", body: "Very long body..."),
                  .init(date: Date(), subject: "Subject2.2", body: "Very long body..."),
                  .init(date: Date(), subject: "Subject2.3", body: "Very long body..."),
                  .init(date: Date(), subject: "Subject2.4", body: "Very long body..."),
                  .init(date: Date(), subject: "Subject2.5", body: "Very long body..."),
                  .init(date: Date(), subject: "Subject2.6", body: "Very long body...")],
    ]
}

// Sidebar
struct Sidebar: View {
    @ObservedObject var store: MailStore
    @Binding var selectedFolder: String?
    @Binding var selectedMail: Mail?
    
    var body: some View {
        List {
            ForEach(Array(store.allMails.keys), id: \.self) { folder in
                NavigationLink(
                    destination: FolderView(
                        title: folder,
                        mails: store.allMails[folder, default: []],
                        selectedMail: $selectedMail
                    ),
                    tag: folder,
                    selection: $selectedFolder
                ) {
                    Text(folder).font(.headline)
                }
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Folders")
    }
}

// FolderView
struct FolderView: View {
    let title: String
    let mails: [Mail]
    @Binding var selectedMail: Mail?
    
    var body: some View {
        List {
            ForEach(mails) { mail in
                NavigationLink(
                    destination: MailView(mail: mail),
                    tag: mail,
                    selection: $selectedMail
                ) {
                    VStack(alignment: .leading) {
                        Text(mail.subject)
                        Text(mail.date, style: .date)
                    }
                }
            }
        }.navigationTitle(title)
    }
}


// mailview
struct MailView: View {
    let mail: Mail
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mail.subject)
                .font(.headline)
            Text(mail.date, style: .date)
            Text(mail.body)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {}) {
                    Image(systemName: "person.crop.circle")
                }
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Image(systemName: "person")
                Spacer()
                Image(systemName: "ellipsis")
                Spacer()
                Image(systemName: "trash")
            }
        }
        .navigationTitle(mail.subject)
        .navigationBarBackButtonHidden(true)
    }
}
