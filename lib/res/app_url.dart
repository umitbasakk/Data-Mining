class AppUrl{
  static var baseUrl = 'http://10.0.2.2:1323';
  //AUTH
  static var loginEndPoint = baseUrl + '/login';
  static var registerEndPoint = baseUrl + '/register';
  static var verifyEndPoint = baseUrl +'/verify';
  static var resendCodeEndPoint = baseUrl + '/resendCode';
  static var changePasswordEndPoint = baseUrl + '/changePassword';
  static var updateProfileEndPoint = baseUrl + '/updateProfile';
  //AI
  static var requestAIEndPoint = baseUrl+'/ai/requestAI';
  static var getAllRequestOfUserEndPoint = baseUrl + '/ai/getAllRequests';
}