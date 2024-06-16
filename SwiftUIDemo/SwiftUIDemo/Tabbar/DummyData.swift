//
//  DummyData.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import Foundation
import SwiftUI

struct Info {
    let image:String
    let name:String
    let story:String
    let hobbies:[String]
    let foods:[String]
    let colors:[Color]
    let funFacts:[String]
}

let information = Info(
    image: "Placeholder",
    name: "The Elephant and the Ants",
    story: "There was once a pleased elephant who generally harassed smaller animals. He would go to the ant colony and shower water on the ants. The ants, with their size, could just cry. The elephant laughed and threatened the ants that he would kill them.\n\nThe ants had enough and chose to show the elephant a lesson.\n\nThey went straight into the elephant's trunk and started messing with him. The elephant started crying in pain. He understood his mistake and apologised to the ants and every one of the animals he had harassed.",
    hobbies: ["bicycle","ticket.fill","book.fill"],
    foods: ["🌭","🍔","🥗","🍕"],
    colors: [Color.blue,Color.purple,Color.yellow,Color.teal],
    funFacts: ["The femur is the longest and largest bone in the human body.","The moon is 238,900 miles away.","Prince’s last name was Nelson.","503 new species were discovered in 2020.","Ice is 9 percent less dense than liquid water.","You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐","A collection of hippos is called a bloat.","White sand beaches are made of parrotfish poop."])
