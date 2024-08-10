import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    Key? key,
  }):super(key:key);

  @override 
  State<ReportScreen> createState() => _ReportScreenState();
}

class LevelReport {
  final String title;
  final ImageIcon icon ;
  const LevelReport(this.title,this.icon);
}
class ReportActor{
  final String title;
  const ReportActor(this.title);
}

String? valueImage;

class _ReportScreenState extends State<ReportScreen>{

  List<LevelReport> levelReport = <LevelReport>[
    const LevelReport("Ý kiến", ImageIcon(AssetImage("assets/icons/smile.png"),size: 30,)),
    const LevelReport("Bình thường", ImageIcon(AssetImage("assets/icons/normal.png"),size: 30,)),
    const LevelReport("Khẩn cấp", ImageIcon(AssetImage("assets/icons/angry.png"),size: 30,)),
  ]; 

  List<ReportActor> reportTo = <ReportActor>[
    const ReportActor("Quản lí chung cư"),
    const ReportActor("Người dân chung cư"),

  ];

  LevelReport? selectedUser ;

  ReportActor? selectedActor ;

  @override 
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: size.height*0.03 ,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "PHẢN HỒI",
          style: TextStyle(
            fontSize: size.height*0.025, 
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle:true,
        toolbarHeight: size.height*0.07,
      ),

      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20,),
              Container(
                height: size.height*0.75,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border:Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12,50,12,0),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ProblemTitle(size),
                      const SizedBox(height: 15,),
                      const Text(
                        "Nội dung",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black26,
                        ),  
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(2, 5, 2, 0),
                        padding: const EdgeInsets.fromLTRB(7,0,7,0),
                        height: size.height*0.25,
                        decoration:BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: const TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập nội dung ..."
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: 200,
                        height:40,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey , )
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<LevelReport> (
                            hint: const Text("Mức độ phản hồi"),
                            value: selectedUser,
                            onChanged:(LevelReport? value) => setState(() {
                              selectedUser = value ;
                            }),
                            items: levelReport.map((LevelReport? item) => DropdownMenuItem<LevelReport>(
                              value: item!,
                              child: Row(
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )).toList(),
                          ) ,
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Flexible(
                        child: Container(
                          width: 200,
                          height:40,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey , )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              valueImage == null ? 
                                Text(
                                  "Hình ảnh",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ) :
                                Flexible(
                                  child: Container(
                                    child: Text(
                                      valueImage.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ),
                                ),
                              SizedBox(width:85),
                              Icon(Icons.image, size: 24,),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        width: 200,
                        height:40,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey , )
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ReportActor> (
                            hint: const Text("Phản hồi với"),
                            value: selectedActor,
                            onChanged:(ReportActor? value) => setState(() {
                              selectedActor = value ;
                            }),
                            items: reportTo.map((ReportActor? item) => DropdownMenuItem<ReportActor>(
                              value: item!,
                              child: Row(
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )).toList(),
                          ) ,
                        ),
                      ),
                    ],
                  ) ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProblemTitle(size) => Flexible(
    flex: 1,
    fit: FlexFit.tight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Tiêu đề",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: Colors.black26,
            fontFamily: "Segoe UI",
          ),  
        ), 
        Padding(
          padding: EdgeInsets.only(left: 2),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              border:  UnderlineInputBorder( ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:Colors.grey)
              ),
              hintText: "Nhập tiêu đề ...",
            ),
          ),
        ),
      ],
    ),
  );
  // Widget ProblemContent() => 

}