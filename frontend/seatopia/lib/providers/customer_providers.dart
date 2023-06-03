import 'package:flutter/material.dart';
import 'package:frontend/networking/networking.dart';
import 'package:frontend/src/models/shops_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../routes.dart';

class CustomerProvider with ChangeNotifier {
  bool isLoading = false;

  bool isMapLoading = false;

  List<Shops> allShops = [];
  List<Marker> markersList = [];
  Future<void> signUpCustomer({
    required String username,
    required String email,
    required String password,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var data = {
        "name": username,
        "email": email,
        "password": password,
        "phone": phone,
        "uid": "SoemthingUnique",
      };

      var result = await NetworkingService().post("api/customer/signUp", data);
      // var result = await NetworkingService().get("");
      print("the result for signup : $result");
      isLoading = false;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.customerHomeRoute, (route) => false);
    } catch (e) {
      print("something went wrong Signup: $e");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginCustomer({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var data = {
        "email": email,
        "password": password,
      };

      var result = await NetworkingService().post("api/customer/logIn", data);
      // var result = await NetworkingService().get("");
      print("the result for Login : $result");
      isLoading = false;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.customerHomeRoute, (route) => false);
    } catch (e) {
      print("something went wrong Login: $e");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllShops({required BuildContext context}) async {
    try {
      isMapLoading = true;
      notifyListeners();

      var result = await NetworkingService().get(
        "api/customer/getAllShops",
      );
      final parsed = result.cast<Map<String, dynamic>>();
      allShops = parsed.map<Shops>((json) => Shops.fromJson(json)).toList();
      makeMarkers();
      // var result = await NetworkingService().get("");
      // List<Shops> shopList = Shops.fromJson(result);
      print(
          "the result for Login : ${allShops.first.coordinates.latitude} ${allShops.first.coordinates.longitude}");

      isMapLoading = false;
      notifyListeners();
      // Navigator.pushNamedAndRemoveUntil(
      //     context, Routes.customerHomeRoute, (route) => false);
    } catch (e) {
      print("something went wrong Login: $e");
      isLoading = false;
      notifyListeners();
    }
  }

  void makeMarkers() {
    for (var i = 0; i < allShops.length; i++) {
      Marker marker = Marker(
        markerId: MarkerId(allShops[i].name),
        position: LatLng(allShops[i].coordinates.latitude,
            allShops[i].coordinates.longitude),
        infoWindow: InfoWindow(title: allShops[i].name),
      );

      markersList.add(marker);
    }
    notifyListeners();
  }
}
