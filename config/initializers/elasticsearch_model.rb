require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new log: true,
                                                        scheme: 'http',
                                                        host: 'localhost',
                                                        port: 9200,
                                                        user: ENV.fetch('ELASTICSEARCH_USER', nil),
                                                        password: ENV.fetch('ELASTICSEARCH_PASSWORD', nil)
