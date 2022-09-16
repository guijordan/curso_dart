class PessoaGetter {
  static final PessoaGetter _instancia = PessoaGetter._constutorNomeado();
  String? nome;

  PessoaGetter._constutorNomeado();

  static PessoaGetter get instancia {
    return _instancia;
  }
}
