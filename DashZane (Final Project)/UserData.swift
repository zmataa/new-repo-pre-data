import Foundation

struct UserData {
    var username: String
    var password: String
    var dataList: [DataItem] = []

    mutating func addDataItem(username: String, password: String, website: String) {
        let newItem = DataItem(username: username, password: password, website: website)
        dataList.append(newItem)
    }
    
}

struct DataItem{
    var username: String
    var password: String
    var website: String
}
