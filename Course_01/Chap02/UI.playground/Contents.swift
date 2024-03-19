import UIKit

var emojiDict: [String: String] = ["Ghost": "👻",
                                   "Poop":"💩",
                                   "Angry":"😤",
                                   "Scream":"😱",
                                   "Alien monster":"👾"
                                    ]

var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]

let containerView = UIView(frame: CGRect(x: 0, y: 0,width: 300, height: 300))
containerView.backgroundColor = UIColor.orange
