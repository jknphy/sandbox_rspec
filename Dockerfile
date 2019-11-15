FROM ruby:2.5

ENV TERM xterm-256color

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install --path ./.vendor/bundler

RUN bundle exec rspec --init

CMD ["./hello.rb"]
