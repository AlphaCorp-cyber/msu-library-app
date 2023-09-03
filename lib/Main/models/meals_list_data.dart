// ignore_for_file: non_constant_identifier_names



class MealsListData {
  MealsListData({
    
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

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      
      titleTxt: 'Business Sciences',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    MealsListData(
      
      titleTxt: 'Social Sciences',
      meals: <String>[],
     startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
     MealsListData(
      
      titleTxt: 'Education',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    MealsListData(
      
      titleTxt: 'Law',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    MealsListData(
      
      titleTxt: 'Science And Technology',
      meals: <String>[''],
     startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    MealsListData(
      
      titleTxt: 'Arts and Humanities',
      meals: <String>[],
     startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
   
    
    
     MealsListData(
         
      titleTxt: 'Medicine and Health Sciences',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    MealsListData(
      
      titleTxt: 'Engineering and Geo sciences',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
   
    
    MealsListData(
      
      titleTxt: 'Agriculture and Natural Resources Management',
      meals: <String>[],
      startColor: '#3BA6BF',
      endColor: '#3BA6BF',
    ),
    
  ];
}
