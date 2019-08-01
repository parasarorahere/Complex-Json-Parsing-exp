

class MasterData
{
  Data   masterData_Data;

MasterData(this.masterData_Data);

  factory MasterData.fromJson(Map<String, dynamic> parsedJson){
    return MasterData(Data.fromJson(parsedJson));
  }
}

class Data{

  final List<LocationLevelModel> locationlevels;
  final List<LocationModel> locatioModels;

  Data(
      {
        this.locationlevels,
        this.locatioModels
  }
  );
  factory Data.fromJson(Map<String, dynamic> parsedJson){


    List<LocationLevelModel> locationLevel = new List<LocationLevelModel>();
    List<LocationModel> locationModel = new List<LocationModel>();

    parsedJson['locationLevelModel'].map((i) => locationLevel.add(LocationLevelModel(i["levelName"],i["dLocationLevelNo"])));

    parsedJson['locationModels'].map((i) => locationModel.add(LocationModel(i["locationName"],
        i["levelNo"],
        i["dLocationID"],
        i["parentDLocationID"])));


    return Data(locationlevels: locationLevel,locatioModels: locationModel);
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
