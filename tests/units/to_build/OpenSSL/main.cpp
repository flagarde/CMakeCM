#include <stdio.h>
#include <string.h>

#include <openssl/ssl.h>
#include <openssl/err.h>

void init_openssl()
{
  SSL_load_error_strings();
  OpenSSL_add_ssl_algorithms();
}

void cleanup_openssl()
{
  EVP_cleanup();
}

SSL_CTX *create_context()
{
  const SSL_METHOD *method;
  SSL_CTX *ctx;

  method = SSLv23_server_method();

  ctx = SSL_CTX_new(method);
  if (!ctx)
  {
    perror("Unable to create SSL context");
    ERR_print_errors_fp(stderr);
    exit(EXIT_FAILURE);
  }

  return ctx;
}

void configure_context(SSL_CTX *ctx)
{
  SSL_CTX_set_ecdh_auto(ctx, 1);
}

int main(int argc, char **argv)
{
  SSL_CTX *ctx;

  init_openssl();
  ctx = create_context();

  configure_context(ctx);

  /* Handle connections */
  SSL *ssl;

  ssl = SSL_new(ctx);
  SSL_shutdown(ssl);
  SSL_free(ssl);

  SSL_CTX_free(ctx);
  cleanup_openssl();
}
