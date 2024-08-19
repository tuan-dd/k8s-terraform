output "subscription_details" {
  value = { for key, sub in google_pubsub_subscription.subscriptions : key => sub.topic }
}
