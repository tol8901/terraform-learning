resource "github_repository" "profile" {
  name = var.github_username

  has_downloads = false
  has_issues    = false
  has_projects  = false
  has_wiki      = false

  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  vulnerability_alerts = true
}

locals {
  files = toset(fileset("${path.module}/assets", "*"))
}

resource "github_repository_file" "file" {
  for_each = local.files

  content    = file("${path.module}/assets/${each.key}")
  file       = each.key
  repository = github_repository.profile.name
}
