require 'datadog/statsd'
require 'ddtrace'


Datadog::Tracing.before_flush do |trace|
  trace
end

Datadog.configure do |c|
  c.tracing.enabled = true
  c.runtime_metrics.enabled = true
  c.runtime_metrics.statsd = Datadog::Statsd.new(ENV.fetch('DD_AGENT_HOST', 'localhost'), 8125)
  c.env = Rails.env
  c.tracing.instrument :rails, service_name: "sample-#{Rails.env}"
  c.tracing.instrument :rack, quantize: { query: { show: :all } }
  c.profiling.enabled = true
  c.service = "sample-#{Rails.env}"
end
