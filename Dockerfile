FROM ruby:3.4.5-slim

# Install essential dependencies for building gems and connecting to Postgres
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y \
    build-essential \
    libpq-dev \
    libyaml-dev \
    pkg-config \
    git \
    curl \
    shared-mime-info \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the Rails port
EXPOSE 3000

# Start the Rails server by default
CMD ["rails", "server", "-b", "0.0.0.0"]
