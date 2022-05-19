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
    @Published var events = [Event]()
    
    func observeEvents() {
        let eventsRef = Database.database().reference().child("1Ir88Rs-GFnIjrifswFvxCJNAff8epolmsgVShuTpE5E/FirebaseData")
        eventsRef.observe(.value, with: { snapshot in
            
            var tempAthletes = [Athlete]()
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any], let event = dict["Event"] as? String, let name = dict["Name"] as? String, let points = dict["Points"] as? Int, let position = dict["Position"] as? Int, let score = dict["Score"] as? Double, let school = dict["School"] as? String {
                    let athlete = Athlete(event: event, name: name, points: points, position: position, score: score, school: school)
                    tempAthletes.append(athlete)
                }
            }
            
            self.athletes = tempAthletes
            var eventNames : [String] = []
            for athlete in self.athletes {
                if !eventNames.contains(athlete.event) {
                    eventNames.append(athlete.event)
                    self.events.append(Event(athletes: [athlete], name: athlete.event))
                }
                else {
                    let index = eventNames.firstIndex(of: athlete.event)
                    self.events[index ?? 0].athletes.append(athlete)
                }
            }
        })
    }
}
