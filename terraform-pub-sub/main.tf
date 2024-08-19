data "google_project" "project" {
  project_id = var.project_id
}


resource "google_pubsub_topic" "topics" {
  for_each = { for topic, should_create in var.create_topics : topic => should_create if should_create }
  project  = var.project_id
  name     = each.key
}

locals {
  # Flatten the map to generate a list of topic-subscription pairs
  topic_sub_pairs = flatten([
    for topic, subs in var.subscriptions : [
      for sub in subs : {
        topic        = topic
        subscription = sub
      }
      if lookup(var.create_subscriptions, sub, false) # Only include if true in create_subscriptions
    ]
  ])
}


resource "google_pubsub_subscription" "subscriptions" {
  for_each = { for pair in local.topic_sub_pairs : pair.subscription => pair }

  project = var.project_id
  name    = each.key
  topic   = each.value.topic

  message_retention_duration   = var.message_retention_durations[each.key]
  retain_acked_messages        = var.retain_acked_messages[each.key]
  ack_deadline_seconds         = var.ack_deadline_seconds[each.key]
  enable_message_ordering      = var.enable_message_orderings[each.key]
  enable_exactly_once_delivery = var.enable_exactly_once_deliveries[each.key]

  expiration_policy {
    ttl = var.expiration_policies[each.key]
  }

  retry_policy {
    minimum_backoff = var.retry_policies[each.key][0]
    maximum_backoff = var.retry_policies[each.key][1]
  }

  filter = lookup(var.filters, each.key, null)

  depends_on = [google_pubsub_topic.topics]
}
