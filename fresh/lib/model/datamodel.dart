// ignore_for_file: non_constant_identifier_names

class LoginModel {
  final int status;
  final String MsgText;
  final String first_Name;
  final String last_Name;
  final int phone_Number;
  final String passWord;
  final String address;
  final int Customer_ID;
  final String Email;

  LoginModel(
      this.status,
      this.MsgText,
      this.first_Name,
      this.last_Name,
      this.phone_Number,
      this.passWord,
      this.address,
      this.Customer_ID,
      this.Email);
  factory LoginModel.fromJson(Map<String, dynamic> fromJson) {
    return LoginModel(
        fromJson["status"],
        fromJson["MsgText"],
        fromJson["Data"][0]["first_Name"],
        fromJson["Data"][0]["last_Name"],
        fromJson["Data"][0]["phone_Number"],
        fromJson["Data"][0]["passWord"],
        fromJson["Data"][0]["address"],
        fromJson["Data"][0]["Customer_ID"],
        fromJson["Data"][0]["Email"]);
  }
}

//كلاس موديل لل category
class FritCatigoodel {
  
  final String prduct_Name;
  final int category_ID;
  final int product_ID;
  final double price;

  FritCatigoodel(
    
    this.prduct_Name, 
    this.category_ID,
    this.product_ID,
    this.price);

  factory FritCatigoodel.fromJson(Map<String, dynamic> fromJson) {
    return FritCatigoodel(
      
      fromJson["prduct_Name"],
      fromJson["category_ID"],
      fromJson["product_ID"],
      double.parse(fromJson["price"].toString()),
    );
  }
 
}


// vegetable model
class VegetableModel {
  
  final String prduct_Name;
  final int category_ID;
  final int product_ID;
  final double price;

  VegetableModel (
    
    this.prduct_Name, 
    this.category_ID,
    this.product_ID,
    this.price);

  factory VegetableModel .fromJson(Map<String, dynamic> fromJson) {
    return VegetableModel (
      
      fromJson["prduct_Name"],
      fromJson["category_ID"],
      fromJson["product_ID"],
      double.parse(fromJson["price"].toString()),
    );
  }
 
}