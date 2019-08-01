

class MasterData
{
  List<LocationLevelModel> locationlevels = List<LocationLevelModel>();
  List<LocationModel> locatioModels = List<LocationModel>();

  MasterData(Map<String,dynamic> parsedJson)
  {
    for (int i=0; i < parsedJson['locationLevelModel'].length; i++){
      Map<String,dynamic> dict = parsedJson['locationLevelModel'][i];
      this.locationlevels.add(LocationLevelModel(
          dict["levelName"],
          dict["dLocationLevelNo"]));
    }

    for (int i=0; i < parsedJson['locationModels'].length; i++){
      Map<String,dynamic> dict = parsedJson['locationModels'][i];
      this.locatioModels.add(LocationModel(
          dict["locationName"],
          dict["levelNo"],
          dict["dLocationID"],
          dict["parentDLocationID"]));
    }
  }
}

class LocationLevelModel{

  String   levelName;
  int levelNumber;
  LocationLevelModel(this.levelName,this.levelNumber);
}

class LocationModel{

  String locationName;
  int levelNo;
  int dLocationID;
  int parentDLocationID;

  LocationModel(this.locationName,this.levelNo,this.dLocationID,this.parentDLocationID);
}