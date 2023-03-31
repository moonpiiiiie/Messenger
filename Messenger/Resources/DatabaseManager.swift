//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Cheng Xue on 3/25/23.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    
}

// MARK: - Account management
extension DatabaseManager{
    
    public func userExists(with email: String, completion: @escaping((Bool)-> Void)) {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        })
    }
    
    /// Inserts new user to database
    public func insertUser(with user: ChatAppUser) {
        var safeEmail = user.emailAddress.replacingOccurrences(of: ".", with: "-")
        database.child(safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    //let profilePictureUrl: String
}
