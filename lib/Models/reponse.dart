class Response{
  String bname;
  String gname;
  String percentage;
  String result;
  Response({this.bname,this.gname,this.percentage,this.result});
  Response.fromJson(Map<String, dynamic> json) {
    bname = json['fname'];
    gname = json['sname'];
    percentage = json['percentage'];
    result = json['result'];
  }
}