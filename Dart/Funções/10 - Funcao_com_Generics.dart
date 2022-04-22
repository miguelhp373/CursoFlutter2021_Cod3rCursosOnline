//GENERICS

Object segundoElementoV1(List lista) {
  return lista.length >= 2 ? List[1] : null;
}

E segundoElementoV2(List<E> lista) {
  return lista.length >= 2 ? List[1] : null;
}

main() {
  var lista = [3, 6, 7, 12, 45, 78, 1];

  print(segundoElementoV1(lista));
  print(segundoElementoV2<int>(lista));
}
