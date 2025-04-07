enum FromWho { me, him }

// Identidad atómica: la unidad más pequeña en una App
class Message {
  final String text;
  final String? imagesURL;
  final FromWho fromWho;

  Message({required this.text, this.imagesURL, required this.fromWho});
}
