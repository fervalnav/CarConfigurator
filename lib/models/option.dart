class Option{
  final int id;
  String text;
  double price;
  String link;

  // van dentro de llaves para que sean propiedades opcionales
  Option(this.id, this.text,this.price, this.link);

  getPrice() {
    return price;
  }
}