require 'datadog/statsd'
require 'ddtrace'


=begin
Datadog::Tracing.before_flush do |trace|
  trace.spans.each do |span|
    if span.resource == 'SELECT "posts".* FROM "posts"'
      span.resource = span.resource.gsub('posts', 'tests')
    end
  end
  trace
end
=end

Datadog.configure do |c|
  c.tracing.enabled = true
  c.runtime_metrics.enabled = true
  c.runtime_metrics.statsd = Datadog::Statsd.new(ENV.fetch('DD_AGENT_HOST', 'localhost'), 8125)
  c.env = Rails.env
  c.tracing.instrument :rails, service_name: "sample-#{Rails.env}"
  c.tracing.instrument :rack, quantize: { query: { show: :all } }
  c.profiling.enabled = true
  c.service = "sample-#{Rails.env}"

=begin
  c.tracing.sampler = Datadog::Tracing::Sampling::PrioritySampler.new(
    post_sampler: Datadog::Tracing::Sampling::RuleSampler.new(
      [
        Datadog::Tracing::Sampling::SimpleRule.new(service: 'sample-development', sample_rate: 1.0000)
      ]
    )
  )
=end
end
