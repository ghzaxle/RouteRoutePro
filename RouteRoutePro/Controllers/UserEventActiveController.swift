//
//  UserEventActiveController.swift
//  RouteRoutePro
//
//  Created by 安齋洸也 on 2018/11/10.
//  Copyright © 2018年 安齋洸也. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class UserEventController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    // map
    var locationManager = CLLocationManager()
    var accuracyRangeCircle: MKCircle?
    
    var data:(eventid: String, eventtitle:String, eventdetail:String, ownerid:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //settings
        print(data?.eventdetail as Any)
	
        //map
        self.locationManager.delegate = self
        
        mapView.setCenter(mapView.userLocation.coordinate, animated: true)
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        
        // ロケーションの精度を設定する
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        // 更新距離（メートル）
        locationManager.distanceFilter = 5
        
        self.mapView.showsUserLocation = false
        
        self.accuracyRangeCircle = MKCircle(center: CLLocationCoordinate2D.init(latitude: 41.887, longitude: -87.622), radius: 50)
        self.mapView.addOverlay(self.accuracyRangeCircle!)
    }
    
    // 位置情報利用許可のステータスが変わった
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .authorizedAlways, .authorizedWhenInUse:
            // 利用可に変更された
            locationManager.startUpdatingLocation()
        case .notDetermined:
            // 位置情報取得確認のメッセージを表示。必須。
            locationManager.requestAlwaysAuthorization()
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.pausesLocationUpdatesAutomatically = false
        default:
            locationManager.stopUpdatingLocation()
        }
    }
    
    // 位置を移動した
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationData = locations.last
        
        // 取得した位置情報の緯度経度
        let latitude = locationData?.coordinate.latitude
        let longitude = locationData?.coordinate.longitude
        let location = CLLocationCoordinate2DMake(latitude!,longitude!)
        
        print("(\(String(describing: latitude)), \(String(describing: longitude)))");
        
        // 表示するマップの中心を、取得した位置情報のポイントに指定
        mapView.setCenter(location, animated: true)
        
        // 表示する領域を設定する
        var region: MKCoordinateRegion = mapView.region
        // 領域設定の中心
        region.center = location
        // 表示する領域の拡大・縮小の係数
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        // 決定した表示設定をMapViewに適用
        mapView.setRegion(region, animated: true)
        
        // 地図の形式。Standardがデフォルトの地図。Satteliteが航空地図。
        mapView.mapType = MKMapType.standard
        // 位置情報は既に取得したので、これ以降取得を行わないように位置情報取得を停止
//        locationManager.stopUpdatingLocation()
        
    }
    
    // 位置情報取得が失敗した際に呼ばれる。
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("map failed..")
    }
    
    // 利用できる位置情報か確認
    func filterAndAddLocation(_ location: CLLocation) -> Bool{
        let age = -location.timestamp.timeIntervalSinceNow
        
        if age > 10{
            return false
        }
        if location.horizontalAccuracy < 0{
            return false
        }
        if location.horizontalAccuracy > 100{
            return false
        }
        return true
    }
}
