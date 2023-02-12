class Food {
  String name;
  String pic;
  String price;
  int index;
  Food(String pic, String name, String price, int index) {
    this.name = name;
    this.pic = pic;
    this.price = price;
    this.index = index;
  }
  String getName() {
    return this.name;
  }

  String getPic() {
    return this.pic;
  }

  String getPrice() {
    return this.price;
  }

  int getIndex() {
    return this.index;
  }
}
