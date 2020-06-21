//
//  Storage.swift
//  Weather
//
//  Created by Алихан on 21/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

class Storage {
    
    //MARK: - Getters
    
    static func valueForKey(key: String) -> Bool? {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
    static func valueForKey(key: String) -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: key)
    }
    
    static func objectForKey<T:Decodable>(key: String, type: T.Type) -> T? {
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: key)
        let decoder = JSONDecoder()
        if let data = data as? Data {
            return try? decoder.decode(type, from: data)
        }
        
        return nil
    }
    
    
    //MARK: - Setters
    
    static func set(value: Bool, forKey key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func set(value: String, forKey key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func set<T:Codable>(object: T, forKey key:String) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(object) {
            defaults.set(data, forKey: key)
        }
    }
    
    
    //MARK: - Functions
    static func resetKey(key:String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
    
    static func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation(); dictionary.keys.forEach {
            key in defaults.removeObject(forKey: key)
        }
    }
    
}
