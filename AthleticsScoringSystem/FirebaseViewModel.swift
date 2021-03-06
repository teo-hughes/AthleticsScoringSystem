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
    @Published var results = [Result]()
    
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
            if tempAthletes.count > 1 {
                for i in 0..<tempAthletes.count {
                    
                    for j in 0..<tempAthletes.count - i - 1 {
                        
                        if tempAthletes[j].position > tempAthletes[j + 1].position {
                            tempAthletes.swapAt(j + 1, j)
                        }
                    }
                }
            }
            
            self.athletes = tempAthletes
            self.events = []
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
    
    func observeResults() {
        let resultsRef = Database.database().reference().child("1Ir88Rs-GFnIjrifswFvxCJNAff8epolmsgVShuTpE5E/ResultsData")
        resultsRef.observe(.value, with: { snapshot in
            
            var tempResults = [Result]()
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any],  let school = dict["School"] as? String, let ageGroup = dict["Age Group"] as? String, let points = dict["Points"] as? Int {
                    let result = Result(school: school, ageGroup: ageGroup, points: points)
                    tempResults.append(result)
                }
            }
            
            if tempResults.count > 1 {
                for i in 0..<tempResults.count {
                    
                    for j in 0..<tempResults.count - i - 1 {
                        
                        if tempResults[j].points < tempResults[j + 1].points {
                            tempResults.swapAt(j + 1, j)
                        }
                    }
                }
            }
            self.results = tempResults
            
        })
    }
}
