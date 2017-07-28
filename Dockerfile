FROM sebp/elk

# filters
ADD ./serilog-http-sink.conf /etc/logstash/conf.d/serilog-http-sink.conf


