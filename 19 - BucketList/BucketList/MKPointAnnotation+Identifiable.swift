//
//  MKPointAnnotation+Identifiable.swift
//  BucketList
//
//  Created by Samuel Shi on 4/24/21.
//  Copyright © 2021 samrshi. All rights reserved.
//

import MapKit

extension MKPointAnnotation: Identifiable {
  public var id: UUID {
    UUID()
  }
}
