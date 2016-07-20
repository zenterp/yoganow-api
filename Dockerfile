FROM ruby:2.1

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN sudo apt-get install nodejs
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

