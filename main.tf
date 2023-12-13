terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 5.0"
        }
    }
}

resource "github_repository" "profile_repository" {
    name="profile_repository"
}

resource "github_repository_file" "profile_readme" {
    repository = github_repository.profile_repository.name
    
    content = "value"
    file = "value"
    
}