FROM amazon/opendistro-for-elasticsearch:1.13.2

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch analysis-kuromoji
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch analysis-icu
