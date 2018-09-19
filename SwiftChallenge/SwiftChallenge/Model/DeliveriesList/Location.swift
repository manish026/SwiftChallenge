//
//	Location.swift
//
//	Create by Manish Malviya on 15/9/2018
//	Copyright © 2018 NeoSOFT Technologies. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Location : Codable {

	let address : String?
	let lat : Double?
	let lng : Double?


	enum CodingKeys: String, CodingKey {
		case address = "address"
		case lat = "lat"
		case lng = "lng"
	}
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        address = try values.decodeIfPresent(String.self, forKey: .address)
//        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
//        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
//    }


}


