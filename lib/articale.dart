
///## Artical
///
///### info:
///for encapsulating the raw data of the artical <br/> in this model class
///
///### data:
/// - author
/// - title
/// - describition
/// - imageUrl
class Articale {
  String? author, title, describition, imageUrl;
  Articale(Map data) {
    describition = data["description"];
    imageUrl = data["urlToImage"];
    title = data["title"];
    author = data["author"];
  }
}
