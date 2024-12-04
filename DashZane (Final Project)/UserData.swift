import Foundation

struct UserData: Codable, Identifiable { //makes userdata usable by userdefaults storage
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var dataList: [DataItem] = []

    mutating func addDataItem(username: String, password: String, website: String) {
        let newItem = DataItem(username: username, password: password, website: website)
        dataList.append(newItem)
    }
    
}

struct DataItem: Codable, Identifiable{
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var website: String
}
