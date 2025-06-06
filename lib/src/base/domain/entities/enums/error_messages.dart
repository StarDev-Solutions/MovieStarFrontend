enum ErrorMessages {
  token,
  server,
  secure,
  tlsCertificate,
  generic,
  timeout,
  unknown,
  unavailable,
}

extension ErrorMessagesExtension on ErrorMessages {
  String get message {
    switch (this) {
      case ErrorMessages.token:
        return 'Sua sessão está expirada, por favor entre novamente.';
      case ErrorMessages.server:
        return 'Não foi possível acessar o servidor. Por favor, verifique sua conexão de rede.';
      case ErrorMessages.secure:
        return 'Não foi possivel estabelecer uma conexão segura com o servidor.';
      case ErrorMessages.tlsCertificate:
        return 'Não foi possivel estabelecer uma conexão segura, devido a uma falha no protocolo TLS/SSL.';
      case ErrorMessages.generic:
        return 'Ocorreu um erro ao estabelecer conexão com o servidor.';
      case ErrorMessages.timeout:
        return 'Não foi possivel acessar o servidor. Tempo Excedido.';
      case ErrorMessages.unknown:
        return 'Um erro desconhecido aconteceu! Por favor entre em contato com o suporte.';
      case ErrorMessages.unavailable:
        return 'Servidor ou funcionalidade temporariamente indisponível.';
    }
  }
}
