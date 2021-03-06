//
//  MkPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Samuel Shi on 2/5/21.
//  Copyright © 2021 samrshi. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
  public var wrappedTitle: String {
    get {
      self.title ?? ""
    }
    
    set {
      title = newValue
    }
  }
  
  public var wrappedSubtitle: String {
    get {
      self.subtitle ?? ""
    }
    
    set {
      subtitle = newValue
    }
  }
}
