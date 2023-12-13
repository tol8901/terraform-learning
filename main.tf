resource "github_repository" "profile" {
    name= var.github_username
}

resource "github_repository_file" "profile_readme" {
    repository = github_repository.profile_repository.name

    content = "value"
    file = "readme.md"
    
}