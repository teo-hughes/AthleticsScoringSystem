//
//  FirebaseViewModel.swift
//  Athletics Scorer
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//
import Foundation
import FirebaseDatabase



class FirebaseViewModel: ObservableObject {
    @Published var athletes = [Athlete]()
    
    func observeEvents() {
        let eventsRef = Database.database().reference().child("1Ir88Rs-GFnIjrifswFvxCJNAff8epolmsgVShuTpE5E/FirebaseData")
        eventsRef.observe(.value, with: { snapshot in
            
            var tempAthletes = [Athlete]()
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any], let event = dict["Event"] as? String, let name = dict["Name"] as? String, let points = dict["Points"] as? Int, let position = dict["Position"] as? Int, let score = dict["Score"] as? Double, let school = dict["School"] as? String {
                    let athlete = Athlete(Event: event, Name: name, Points: points, Position: position, Score: score, School: school)
                    tempAthletes.append(athlete)
                }
            }
            
            self.athletes = tempAthletes
        })
    }
}
