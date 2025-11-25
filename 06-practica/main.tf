# Provisioners
# file copiar archivos desde mi máquina loca a algún recurso remoto generalmente VM
# remote-exec Ejecuta comandos en los resursos remotos (SSH o VinRM)
# local-exec Ejecuta comandos en mi máquina local
# mull_resource no crea infraestructura, pero permite usar provisionar independientemente del recurso

resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "az account show"
  }
}

resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
  content  = tls_private_key.generated.private_key_pem
  filename = "myazkey.pem"
}
