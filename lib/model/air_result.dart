class AirResult {
  final String? status;
  final Data? data;

  AirResult({
    this.status,
    this.data,
  });

  AirResult.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'status': status, 'data': data?.toJson()};
}

class Data {
  final String? city;
  final String? state;
  final String? country;
  final Location? location;
  final Current? current;

  Data({
    this.city,
    this.state,
    this.country,
    this.location,
    this.current,
  });

  Data.fromJson(Map<String, dynamic> json)
      : city = json['city'] as String?,
        state = json['state'] as String?,
        country = json['country'] as String?,
        location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        current = (json['current'] as Map<String, dynamic>?) != null
            ? Current.fromJson(json['current'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'city': city,
        'state': state,
        'country': country,
        'location': location?.toJson(),
        'current': current?.toJson()
      };
}

class Location {
  final String? type;
  final List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  Location.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        coordinates = (json['coordinates'] as List?)
            ?.map((dynamic e) => e as double)
            .toList();

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}

class Current {
  final Pollution? pollution;
  final Weather? weather;

  Current({
    this.pollution,
    this.weather,
  });

  Current.fromJson(Map<String, dynamic> json)
      : pollution = (json['pollution'] as Map<String, dynamic>?) != null
            ? Pollution.fromJson(json['pollution'] as Map<String, dynamic>)
            : null,
        weather = (json['weather'] as Map<String, dynamic>?) != null
            ? Weather.fromJson(json['weather'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'pollution': pollution?.toJson(), 'weather': weather?.toJson()};
}

class Pollution {
  final String? ts;
  final int? aqius;
  final String? mainus;
  final int? aqicn;
  final String? maincn;

  Pollution({
    this.ts,
    this.aqius,
    this.mainus,
    this.aqicn,
    this.maincn,
  });

  Pollution.fromJson(Map<String, dynamic> json)
      : ts = json['ts'] as String?,
        aqius = json['aqius'] as int?,
        mainus = json['mainus'] as String?,
        aqicn = json['aqicn'] as int?,
        maincn = json['maincn'] as String?;

  Map<String, dynamic> toJson() => {
        'ts': ts,
        'aqius': aqius,
        'mainus': mainus,
        'aqicn': aqicn,
        'maincn': maincn
      };
}

class Weather {
  final String? ts;
  final int? tp;
  final int? pr;
  final int? hu;
  final double? ws;
  final int? wd;
  final String? ic;

  Weather({
    this.ts,
    this.tp,
    this.pr,
    this.hu,
    this.ws,
    this.wd,
    this.ic,
  });

  Weather.fromJson(Map<String, dynamic> json)
      : ts = json['ts'] as String?,
        tp = json['tp'] as int?,
        pr = json['pr'] as int?,
        hu = json['hu'] as int?,
        ws = json['ws'] as double?,
        wd = json['wd'] as int?,
        ic = json['ic'] as String?;

  Map<String, dynamic> toJson() =>
      {'ts': ts, 'tp': tp, 'pr': pr, 'hu': hu, 'ws': ws, 'wd': wd, 'ic': ic};
}
