variable "dcos_download_path" {
  type = "map"


  default = {
   "1.11.0"     = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/25ec1e97e86e8c33fc775e474a779a7001a203e7/dcos_generate_config.ee.sh"
   "1.11.1"     = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/a7908b05bf226783484a97463eacd5d1dcbaa9c6/dcos_generate_config.ee.sh"
   "1.11.2"     = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/ad1aa93db99afacfa0099e419667ab60519c081e/dcos_generate_config.ee.sh"
   "1.11.3"     = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/5fdf7dfae5c4bdb233e8e6a7f198ef6b08c5b067/dcos_generate_config.ee.sh"
   "1.11.4"     = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/2153e9ad7e4e64b57b7c7e323d40b1cdde7f7428/dcos_generate_config.ee.sh"
    "1.11.5"    = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/72124980b21b2b79b0f891dcc67b5f2382dee68a/dcos_generate_config.ee.sh"
    "1.11.6"    = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/e23128e161c6c7892b204b1da43e5f27cd64a208/dcos_generate_config.ee.sh"
   "master"     = "https://downloads.mesosphere.com/dcos-enterprise/testing/master/dcos_generate_config.ee.sh"
  }
}
