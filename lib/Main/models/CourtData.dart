// ignore_for_file: non_constant_identifier_names, file_names



class CourtData {
  CourtData({
    
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<CourtData> tabIconsList = <CourtData>[
    CourtData(
      
      titleTxt: 'Supreme Court',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    CourtData(
      


      
      titleTxt: 'Labour Court',
      meals: <String>[],
     startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
     CourtData(
      
      titleTxt: 'Harare High Court',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    CourtData(
      
      titleTxt: 'Gweru High Court',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    CourtData(
      
      titleTxt: 'Bulawayo High Court',
      meals: <String>[''],
     startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    CourtData(
      
      titleTxt: 'Mutare High Court',
      meals: <String>[],
     startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
   
    
    
     CourtData(
         
      titleTxt: 'Masvingo Court of Zimbabwe',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    CourtData(
      
      titleTxt: 'Chinhoyi High Court',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
   
    
    CourtData(
      
      titleTxt: 'Constitutional Court of Zimbabwe',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    
    
  ];
}
