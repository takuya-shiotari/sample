if ENV['DD_ENV'] != 'ci'
  require 'datadog/statsd'
  require 'datadog'

  Datadog::Tracing.before_flush do |trace|
    trace.spans.each do |span|
      match_data = span&.resource&.match(/\AEXEC\s+sp_executesql\s+N'(.*?)'(,\s+N'([^']+)',\s*(.+))?\z/)
      span.resource = match_data[1] if match_data
    end
    trace
  end

  # Datadog::Tracing.before_flush(
  #   Datadog::Tracing::Pipeline::SpanFilter.new { |span| span.resource =~ /Rails::WelcomeController/ },
  # )

  ENV['DD_TRACE_SAMPLE_RATE'] = '1.0'
  ENV['DD_TRACE_RATE_LIMIT'] = '1000'

  Datadog.configure do |c|
    # c.diagnostics.debug = true

    c.tracing.enabled = !Rails.env.test?
    c.runtime_metrics.enabled = !Rails.env.test?
    c.runtime_metrics.statsd = Datadog::Statsd.new(ENV.fetch('DD_AGENT_HOST', 'localhost'), 8125)
    c.env = Rails.env
    c.tracing.instrument :rails, service_name: "sample-#{Rails.env}"
    c.tracing.instrument :rack, quantize: { query: { show: :all } }
    # c.tracing.instrument :rack, quantize: { query: { show: %w[query], exclude: %w[token] } }
    c.tracing.instrument :redis
    c.tracing.instrument :elasticsearch, service_name: 'elasticsearch', quantize: { show: :all }
    c.tracing.instrument :faraday
    c.tracing.instrument :aws
    c.profiling.enabled = !Rails.env.test?
    c.service = "sample-#{Rails.env}"
    #   c.tracing.sampler = Datadog::Tracing::Sampling::PrioritySampler.new(
    #     post_sampler: Datadog::Tracing::Sampling::RuleSampler.new(
    #       [
    #         Datadog::Tracing::Sampling::SimpleRule.new(service: 'sample-development', sample_rate: 1.0000)
    #       ]
    #     )
    #   )
  end
end
