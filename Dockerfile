FROM ruby:latest

RUN addgroup --gid 5000 app && adduser --system --no-create-home --uid 5000 --gid 5000 app

COPY http_server.rb /opt/
USER app
CMD ["ruby", "/opt/http_server.rb"]
