class IntroImagesResponse {
  List<TourData>? domesticTour;
  List<TourData>? internationalTour;

  IntroImagesResponse({this.domesticTour, this.internationalTour});

  IntroImagesResponse.fromJson(Map<String, dynamic> json) {
    if (json['domestic_tour'] != null) {
      domesticTour = <TourData>[];
      json['domestic_tour'].forEach((v) {
        domesticTour!.add(new TourData.fromJson(v));
      });
    }
    if (json['international_tour'] != null) {
      internationalTour = <TourData>[];
      json['international_tour'].forEach((v) {
        internationalTour!.add(new TourData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.domesticTour != null) {
      data['domestic_tour'] =
          this.domesticTour!.map((v) => v.toJson()).toList();
    }
    if (this.internationalTour != null) {
      data['international_tour'] =
          this.internationalTour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourData {
  String? image;
  String? placeName;
  String? placeCost;

  TourData({this.image, this.placeName, this.placeCost});

  TourData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    placeName = json['place_name'];
    placeCost = json['place_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['place_name'] = this.placeName;
    data['place_cost'] = this.placeCost;
    return data;
  }
}