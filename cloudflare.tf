provider "cloudflare" {
  api_key = var.cloudflare_api_token
}

resource "cloudflare_record" "mail" {
  zone_id = var.cloudflare_zone_id
  name    = "mail"
  value   = "79.170.40.164"
  type    = "A"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "nextcloud" {
  zone_id = var.cloudflare_zone_id
  name    = "nextcloud"
  value   = "86.20.227.202"
  type    = "A"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "cname_wildcard" {
  zone_id = var.cloudflare_zone_id
  name    = "*"
  value   = "gigasproule.github.io"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "cname_benjaminsproule_com" {
  zone_id = var.cloudflare_zone_id
  name    = "benjaminsproule.com"
  value   = "gigasproule.github.io"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "blog" {
  zone_id = var.cloudflare_zone_id
  name    = "blog"
  value   = "gigasproule.github.io"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "mx_wildcard" {
  zone_id  = var.cloudflare_zone_id
  name     = "*"
  value    = "mail.benjaminsproule.com"
  type     = "MX"
  priority = 10
  ttl      = 3600
  proxied  = false
}

resource "cloudflare_record" "mx_benjaminsproule_com" {
  zone_id  = var.cloudflare_zone_id
  name     = "benjaminsproule.com"
  value    = "mail.benjaminsproule.com"
  type     = "MX"
  priority = 10
  ttl      = 3600
  proxied  = false
}

resource "cloudflare_record" "_imaps_tcp" {
  zone_id = var.cloudflare_zone_id
  name    = "_imaps._tcp.benjaminsproule.com"
  type    = "SRV"
  data = {
    name     = "benjaminsproule.com"
    port     = 993
    priority = 0
    proto    = "_tcp"
    service  = "_imaps"
    target   = "mail164.extendcp.co.uk"
    weight   = 1
  }
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_imap_tcp" {
  zone_id = var.cloudflare_zone_id
  name    = "_imap._tcp.benjaminsproule.com"
  type    = "SRV"
  data = {
    name     = "benjaminsproule.com"
    priority = 0
    proto    = "_tcp"
    service  = "_imap"
  }
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_pop3s_tcp" {
  zone_id = var.cloudflare_zone_id
  name    = "_imap._tcp.benjaminsproule.com"
  type    = "SRV"
  data = {
    name     = "benjaminsproule.com"
    port     = 995
    priority = 1
    proto    = "_tcp"
    service  = "_pop3s"
    target   = "benjaminsproule.com"
    weight   = 10
  }
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_pop3_tcp" {
  zone_id = var.cloudflare_zone_id
  name    = "_imap._tcp.benjaminsproule.com"
  type    = "SRV"
  data = {
    name     = "benjaminsproule.com"
    priority = 0
    proto    = "_tcp"
    service  = "_pop3"
  }
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_submission_tcp" {
  zone_id = var.cloudflare_zone_id
  name    = "_submission._tcp.benjaminsproule.com"
  type    = "SRV"
  data = {
    name     = "benjaminsproule.com",
    port     = 465,
    priority = 0,
    proto    = "_tcp",
    service  = "_submission",
    target   = "mail164.extendcp.co.uk",
    weight   = 1
  }
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "txt_benjaminsroule_com" {
  zone_id = var.cloudflare_zone_id
  name    = "benjaminsproule.com"
  value   = "v=spf1 mx a ip4:79.170.40.164/32 ~all"
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_dmarc" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.benjaminsproule.com"
  value   = "v=DMARC1; p=none; rua=mailto:benjamin@benjaminsproule.com; ruf=mailto:benjamin@benjaminsproule.com; fo=1"
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_gitlab-pages-verification-code_blog" {
  zone_id = var.cloudflare_zone_id
  name    = "_gitlab-pages-verification-code.blog"
  value   = "gitlab-pages-verification-code=d19dd5b491239fdef653e5f71b214fa0"
  type    = "TXT"
  ttl     = 1
  proxied = false
}
