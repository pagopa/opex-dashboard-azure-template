variable "github" {
  type = object({
    org        = string
    repository = string
  })
  description = "GitHub Organization and repository name"
  default = {
    org        = "pagopa"
    repository = "opex-dashboard-azure-template" # TODO change with repository name
  }
}

variable "env" {
  type        = string
  description = "Environment"
}
