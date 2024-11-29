enum ErrType{MustbeVerified,ErrorVerifySystem,ErrorLoginSystem,ErrorRegisterSystem,SendedMessage,Authorized,NoError}
	
class ResponseOnApp<T> {
  String? message;
  ErrType? errCode;
  T? data;

  ResponseOnApp({this.message, this.errCode, this.data});

  ResponseOnApp.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    errCode = ErrType.values[json['ErrCode']-1];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['ErrCode'] = this.errCode;
    data['Data'] = this.data;
    return data;
  }
}