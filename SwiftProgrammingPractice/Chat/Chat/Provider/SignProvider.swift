//
//  SignProvider.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import Foundation
import Firebase

class SignProvider {
  private let firesotre = Firestore.firestore()
  private let auth = Auth.auth()
  
  func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
    auth.signIn(withEmail: email, password: password) { (result, error) in
      if let error = error {
        completion(.failure(error))
        
      } else {
        guard let user = result?.user else { return }
        
        self.firesotre
          .collection("User")
          .document(user.uid)
          .getDocument { (snapshot, error) in
            if let error = error {
              completion(.failure(error))
              
            } else {
              guard let data = snapshot?.data(),
                let nickName = data[UserRefereence.nickName] as? String
                else { return }
              
              UserDefaults.standard.set(email, forKey: UserRefereence.email)
              UserDefaults.standard.set(nickName, forKey: UserRefereence.nickName)
              
              completion(.success("Success"))
            }
        }
      }
    }
  }
  
  func signUp(email: String, password: String, nickName: String, completion: @escaping (Result<String, Error>) -> ()) {
    auth.createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        completion(.failure(error))
        
      } else {
        guard let user = result?.user else { return }
        
        self.firesotre
          .collection("User")
          .document(user.uid)
          .setData([
            UserRefereence.email: email,
            UserRefereence.nickName: nickName
          ]) { (error) in
            if let error = error {
              completion(.failure(error))
            } else {
              completion(.success("Success"))
            }
        }
      }
    }
  }
  
  func signOut() throws {
    try auth.signOut()
  }
}
