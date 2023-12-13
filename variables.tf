variable "github_username" {
  description = "The username for the GitHub account."
  type        = string

  default = "tol8901"
}

variable "github_token" {
  description = "GitHub API token"
  type        = string

  sensitive = true
}
