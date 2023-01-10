import Foundation

// MARK: - Company
struct Company: Codable {
    let company: CompanyInfo?
}

// MARK: - CompanyClass
struct CompanyInfo: Codable {
    let count: Int?
    let companyDescription: String?
    let listOfData: [ListOfData]?
}

// MARK: - ListOfDatum
struct ListOfData: Codable {
    let name, modelNumber: String?
    let countries: [String]?
    let price: Price?
    let year: Int?
}

// MARK: - Price
struct Price: Codable {
    let regions: [Region]?
}

// MARK: - Region
struct Region: Codable {
    let name: String?
    let price: Int?
}
