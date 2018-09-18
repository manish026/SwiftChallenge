//
//	Deliveries.swift
//
//	Create by Manish Malviya on 15/9/2018
//	Copyright © 2018 NeoSOFT Technologies. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Deliveries : Codable {

	let descriptionField : String?
	let imageUrl : String?
	let location : Location?


	enum CodingKeys: String, CodingKey {
		case descriptionField = "description"
		case imageUrl = "imageUrl"
		case location
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		location = try Location(from: decoder)
	}


}