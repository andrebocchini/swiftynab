//
//  LandingViewController.swift
//  SwiftYNAB-demo
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import AuthenticationServices
import SwiftYNAB
import UIKit

class LandingViewController: UIViewController {
    
    private var api: YNAB?
    private var authSession: ASWebAuthenticationSession?
    
    private lazy var authUrl: URL = {
        let clientId = URLQueryItem(name: "client_id",
                                    value: "YOUR_OAUTH_CLIENT_ID_GOES_HERE")
        let redirectURI = URLQueryItem(name: "redirect_uri", value: "swiftynab://oauth")
        let responseType = URLQueryItem(name: "response_type", value: "token")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "app.youneedabudget.com"
        urlComponents.path = "/oauth/authorize"
        urlComponents.queryItems = [clientId, redirectURI, responseType]
        
        return urlComponents.url!
    }()
    
    private func oAuthLogin(completion: @escaping (String?, Error?) -> Void) {
        self.authSession?.cancel()
        self.authSession = ASWebAuthenticationSession(url: self.authUrl, callbackURLScheme: "swiftynab") {
            (url: URL?, error: Error?) in
            
            guard let url = url else {
                completion(nil, error)
                return
            }
            
            if let token = self.accessToken(from: url) {
                completion(token, nil)
            }
        }
        self.authSession?.start()
    }
    
    private func accessToken(from url: URL) -> String? {
        guard let fragment = url.fragment else {
            return nil
        }
        
        let fragmentComponents = fragment.split(separator: "&")
        for keyValuePairs in fragmentComponents {
            let keyValuePair = keyValuePairs.split(separator: "=")
            
            if keyValuePair.contains("access_token") {
                if let value = keyValuePair.last {
                    return String(value)
                }
            }
        }
        
        return nil
    }
    
    private func showPersonalAccessTokenInputAlert(completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Personal Token", message: "Enter your YNAB API personal token", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if let textField = alert.textFields?.first,
                let token = textField.text,
                token.count > 0 {
                completion(token)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK - Actions
    
    @IBAction func personalTokenButtonTapped(_ sender: Any) {
        showPersonalAccessTokenInputAlert {
            token in
            self.api = YNAB(accessToken: token)
            self.performSegue(withIdentifier: "showBudgets", sender: nil)
        }
    }
    
    @IBAction func oAuthLoginButtonTapped(_ sender: Any) {
        oAuthLogin {
            (oAuthToken: String?, error: Error?) in
            
            if let token = oAuthToken {
                print("OAuth token received from redirect: \(token)")
                self.api = YNAB(accessToken: token)
                self.performSegue(withIdentifier: "showBudgets", sender: nil)
                return
            }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Unknown error")
            }
        }
    }
    
    // MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBudgets" {
            if let destination = segue.destination as? BudgetsTableViewController {
                destination.api = self.api
            }
        }
    }
    
}
