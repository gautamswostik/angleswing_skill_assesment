// /ckzxljoyd000u14pqy5u4dh5n/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic3dvc3RpayIsImEiOiJja3pwbW0yZWUyejBiMnZxcmlvYzVvaXNkIn0.lHCSJdEle4dD09M3Di3u5A

class MapUrl {
  const MapUrl();

  static const String baseUrl = 'https://api.mapbox.com/styles/v1/swostik';
  static const String acceesToken =
      'pk.eyJ1Ijoic3dvc3RpayIsImEiOiJja3pwbW0yZWUyejBiMnZxcmlvYzVvaXNkIn0.lHCSJdEle4dD09M3Di3u5A';
  static const String templteUrl =
      '$baseUrl/ckzxljoyd000u14pqy5u4dh5n/tiles/256/{z}/{x}/{y}@2x?access_token=$acceesToken';
  static const String id = 'mapbox.mapbox-streets-v8';
}

class LocationUrl {
  static const String mapdatas =
      'https://angelswing-frontend-test-serverless-api.vercel.app/api/locations';
}
