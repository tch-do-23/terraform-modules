provider "github" {
  token = var.github_token
}

resource "github_repository" "private_repo" {
  name        = "final_project-private-repo2024"
  description = "This is my private repository"
  private     = true           # Set to true to create a private repository, or false for public
}
