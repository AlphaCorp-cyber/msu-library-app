//while the app is building let's create the NewsData class





class NewsData {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;

  //let's create the constructor
  NewsData(
    this.title,
    this.author,
    this.content,
    this.date,
    this.urlToImage,
  );

  //we will use dummy data to generate the news,but you can use a third party api or your own backend to extract the data
  //I will copy the data from my previous code, you can create your own data , I used newsApi to get the data
  static List<NewsData> breakingNewsData = [
    NewsData(
        "MSU Library Strategizes in compliance to Program-based budgeting ",
        "Midlands State University",
        "On the 8th of November 2022, Midlands State University Library division conducted a workshop at the Gweru Main Campus aimed towards realigning the Librarys strategic plan in compliance with the Government of Zimbabwes program-based budgeting, National Development Strategy 1, Education 5.0 philosophy and national vision 2030.\n\nMSU Librarian Ms. N. P. Chibanda welcomed members and underlined that the workshop was aimed at crafting a strategic plan that marks a shift from the results-based strategic planning to program-based strategic planning as emphasized in national policies.\n\nAttended by senior library staff, the workshop ended with a new vision, mission and values for the Library. \n\nExecutive Dean of the Faculty of Business Sciences, Dr. M. Mugwati flanked by the Deputy Dean-Faculty of Business Sciences, Mr. D. Mapetera, and Dr. F. Chokera from the Department of Information and Marketing Sciences facilitated and led discussions during the workshop.",
        "2022-08-11",
        "assets/introduction_animation/lib.jpg"),
    NewsData(
        "Library Ambassadors Club Host Library-Resources Orientation",
        "Midlands State University",
        "Midlands State Universitys Library Ambassadors Club equipped level one semester one students with the basic functions of the library at an event held at the Gweru Main Campus on the 29th of October 2022.\n\nIn her welcome remarks, Club President Eulita Chikonye highlighted that the objective of the programme is to educate the first-year students about library services so the students can understand the MSU Library functions and excel in studies.\n\nGiving her presentation, Club member Mitchel July commented that the Library has a vast collection of hardcopy books which cover all the Universitys degree programmes.\n\nClub member Takudzwa Bangure gave an insight of the University Librarys vast electronic resources. \n\nIn his closing remarks, Student Representative Council member, Minister of Academic Affairs Paul Swerakwenda commented that students should take advantage of the MSU Librarys vast physical and digital resources.\n\nThe event was attended by Deputy Librarians Mr. E. Makeke and Ms. S. Mutavayi, Senior Assistant Librarians Mr. R. Masimbiti and Ms. G. Bonde, and Systems Analyst, Mr. P. Chigwagwa.",
        "2022-31-10",
        "assets/introduction_animation/eu.jpg"),
  ];

  static List<NewsData> recentNewsData = [
    NewsData(
        "MSU Library Strategizes in compliance to Program-based budgeting ",
        "Midlands State University",
        "On the 8th of November 2022, Midlands State University Library division conducted a workshop at the Gweru Main Campus aimed towards realigning the Librarys strategic plan in compliance with the Government of Zimbabwes program-based budgeting, National Development Strategy 1, Education 5.0 philosophy and national vision 2030.\n\nMSU Librarian Ms. N. P. Chibanda welcomed members and underlined that the workshop was aimed at crafting a strategic plan that marks a shift from the results-based strategic planning to program-based strategic planning as emphasized in national policies.\n\nAttended by senior library staff, the workshop ended with a new vision, mission and values for the Library. \n\nExecutive Dean of the Faculty of Business Sciences, Dr. M. Mugwati flanked by the Deputy Dean-Faculty of Business Sciences, Mr. D. Mapetera, and Dr. F. Chokera from the Department of Information and Marketing Sciences facilitated and led discussions during the workshop.",
        "2022-08-11",
        "assets/introduction_animation/lib.jpg"),
    NewsData(
        "Library Ambassadors Club Host Library-Resources Orientation",
        "Midlands State University",
        "Midlands State Universitys Library Ambassadors Club equipped level one semester one students with the basic functions of the library at an event held at the Gweru Main Campus on the 29th of October 2022.\n\nIn her welcome remarks, Club President Eulita Chikonye highlighted that the objective of the programme is to educate the first-year students about library services so the students can understand the MSU Library functions and excel in studies.\n\nGiving her presentation, Club member Mitchel July commented that the Library has a vast collection of hardcopy books which cover all the Universitys degree programmes.\n\nClub member Takudzwa Bangure gave an insight of the University Librarys vast electronic resources. \n\nIn his closing remarks, Student Representative Council member, Minister of Academic Affairs Paul Swerakwenda commented that students should take advantage of the MSU Librarys vast physical and digital resources.\n\nThe event was attended by Deputy Librarians Mr. E. Makeke and Ms. S. Mutavayi, Senior Assistant Librarians Mr. R. Masimbiti and Ms. G. Bonde, and Systems Analyst, Mr. P. Chigwagwa.",
        "2022-31-10",
        "assets/introduction_animation/eu.jpg"),
  ];
}
