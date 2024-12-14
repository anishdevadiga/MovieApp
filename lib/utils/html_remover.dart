String removeHtmlTags(String htmlString) {
  final RegExp exp = RegExp(r'<[^>]*>');
  return htmlString.replaceAll(exp, '');
}
