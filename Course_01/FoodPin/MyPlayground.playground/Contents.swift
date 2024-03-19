import UIKit

var greeting = "Hello, playground"

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isFavorite: Bool
    init(name: String, type: String, location: String, image: String, isFavorite: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
    }
    
    init() {
        print("welcome")
        self.init(name: "minhvu", type: "", location: "", image: "", isFavorite: false)
    }
    
    init(name:String){
        print("hello minhvu")
        self.init(name: name, type: "", location: "", image: "", isFavorite: false)
    }
}

var res = Restaurant(name: "plinh")

print(res.name)
