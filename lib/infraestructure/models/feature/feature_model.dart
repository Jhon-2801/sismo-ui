class FeatureModel {
  final int id;
  final String idEvent;
  final int magnitude;
  final String place;
  final String time;
  final bool tsunami;
  final String magType;
  final String title;
  final int longitude;
  final int latitude;
  final String links;

  FeatureModel({
    required this.id,
    required this.idEvent,
    required this.magnitude,
    required this.place,
    required this.time,
    required this.tsunami,
    required this.magType,
    required this.title,
    required this.longitude,
    required this.latitude,
    required this.links,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) => FeatureModel(
        id: json["id"],
        idEvent: json["attributes"]["event_id"],
        magnitude: json["attributes"]["magnitude"],
        place: json["attributes"]["place"],
        time: json["attributes"]["time"],
        tsunami: json["attributes"]["tsunami"],
        magType: json["attributes"]["mag_type"],
        title: json["attributes"]["title"],
        longitude: json["attributes"]["coordinates"]["longitude"],
        latitude: json["attributes"]["coordinates"]["latitude"],
        links: json["links"]["external_url"],
      );
}
