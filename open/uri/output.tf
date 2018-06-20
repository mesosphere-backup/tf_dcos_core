output "path" {
   value = "${lookup(var.dcos_download_path, var.dcos_version, "download path non existant")}"
}
