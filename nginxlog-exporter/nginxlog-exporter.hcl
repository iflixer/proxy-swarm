listen {
  port = 4040
}

namespace = "nginx_access"
format = ""

source = {
  files = ["/var/log/nginx/cis-dle-root.log"]
}

labels {
  status = "$status"
  upstream_status = "$upstream_status"
  upstream_addr = "$upstream_addr"
  cache_status = "$upstream_cache_status"
  method = "$request_method"
  path = "$request_uri"
}