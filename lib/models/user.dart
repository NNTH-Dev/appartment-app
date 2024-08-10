import 'package:flutter/material.dart';

class User{
  int _id;
  String _name;
  String _sex;
  String _email;
  String _phoneNumber;
  Image _image;

  User(this._id, this._name, this._sex, this._email, this._phoneNumber, this._image);
  // Getter Setter
  get getId{
    return _id;
  }
  set setId(int id){
    this._id = id;
  }
  get getName{
    return _name;
  }
  set setName(String name){
    this._name = _name;
  }
  get getSex{
    return _sex;
  }
  set setSex(String sex){
    this._sex = sex;
  }
  get getEmail{
    return _email;
  }
  set setEmail(String email){
    this._email = email;
  }
  get getPhoneNumber{
    return _phoneNumber;
  }
  set setPhoneNumber(String phoneNumber){
    this._phoneNumber = phoneNumber;
  }
  get getImage{
    return _image;
  }
  set setImage(Image image){
    this._image = image;
  }
  void updateUser(int id,String name,String sex,String email,String phoneNumber){
    this._id = id;
    this._name=name;
    this._sex=sex;
    this._email=email;
    this._phoneNumber=phoneNumber;
  }
}
