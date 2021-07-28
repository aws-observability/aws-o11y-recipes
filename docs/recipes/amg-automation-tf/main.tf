terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.13.3"
    }
  }
}

provider "grafana" {
  url  = ""
  auth = ""
}

resource "grafana_data_source" "prometheus" {
  type          = "prometheus"
  name          = "amg"
  is_default    = true
  url           = "https://aps-workspaces.eu-west-1.amazonaws.com/workspaces/xxx"
  json_data {
	http_method     = "POST"
	sigv4_auth      = true
	sigv4_auth_type = "workspace-iam-role"
	sigv4_region    = "eu-west-1"
  }
}

resource "grafana_dashboard" "ho11ydashboard" {
  folder = grafana_folder.ho11yfolder.id
  config_json = file("example-dashboard.json")
}


