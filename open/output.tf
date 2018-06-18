output "script" {
   value = "${data.template_file.script.rendered}"
}

output "path" {
   value = "${lookup(var.dcos_download_path, var.dcos_version, "download path non existant")}"
}
