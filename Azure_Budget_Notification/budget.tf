data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "SG_RG" {
  name     = "SG_RG"
  location = "eastus"
}

resource "azurerm_monitor_action_group" "monitor_action" {
  name                = "monitor_action"
  resource_group_name = azurerm_resource_group.SG_RG.name
  short_name          = "SG_RG"
}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = "budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = "2022-06-01T00:00:00Z"
    end_date   = "2022-07-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "ResourceGroupName"
      values = [
        azurerm_resource_group.SG_RG.name,
      ]
    }

    tag {
      name = "foo"
      values = [
        "bar",
        "baz",
      ]
    }
  }

  notification {
    enabled   = true
    threshold = 80
    operator  = "EqualTo"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]

    contact_groups = [
      azurerm_monitor_action_group.monitor_action.id,
    ]

    contact_roles = [
      "Owner",
    ]
  }

  notification {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = [
      "digbijayinee.clara@stackguardian.io",
      "johannes.scheuerer@stackguardian.io",
    ]
  }
}