import UIKit

func data(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

struct Person: Codable {
    let name: String
    let age: Int
    let isDeveloper: Bool
}

protocol ParserProtocol {
    var nextParser: ParserProtocol? { get set }
    func parse(from file: String) -> [Person]?
}


class ResultParser: ParserProtocol {

    struct Response: Codable {
        let result: [Person]
    }
    
    var nextParser: ParserProtocol?
    
    func parse(from file: String) -> [Person]? {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        let data = try! Data(contentsOf: url)
        guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
            return nextParser?.parse(from: file)
        }
        
        return response.result
    }
    
}

class DataParser: ParserProtocol {

    struct Response: Codable {
        let data: [Person]
    }
    var nextParser: ParserProtocol?
    
    func parse(from file: String) -> [Person]? {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        let data = try! Data(contentsOf: url)
        guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
            return nextParser?.parse(from: file)
        }
        
        return response.data
    }
}

class RootParser: ParserProtocol {

    var nextParser: ParserProtocol?
    
    func parse(from file: String) -> [Person]? {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        let data = try! Data(contentsOf: url)
        guard let response = try? JSONDecoder().decode([Person].self, from: data) else {
            return nextParser?.parse(from: file)
        }
        
        return response
    }
}

let parser = RootParser()
let resultParser = ResultParser()
let dataParser = DataParser()
parser.nextParser = resultParser
resultParser.nextParser = dataParser
dataParser.nextParser = nil
if let result = parser.parse(from: "1") {
    result.forEach { print("\($0.name) of age \($0.age) is\($0.isDeveloper ? " ": " not ")developer") }
}
if let result = parser.parse(from: "2") {
    result.forEach { print("\($0.name) of age \($0.age) is\($0.isDeveloper ? " ": " not ")developer") }
}
if let result = parser.parse(from: "3") {
    result.forEach { print("\($0.name) of age \($0.age) is\($0.isDeveloper ? " ": " not ")developer") }
}

let data1 = data(from: "1")
let data2 = data(from: "2")
let data3 = data(from: "3")
