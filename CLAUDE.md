# CLAUDE.md - Origami Budget Management App

## Project Overview
**Origami** is a mobile-first web application for budget management built with Ruby on Rails. It allows users to register, authenticate, create categories, and track financial transactions (called "deals") across different budget categories.

## Tech Stack

### Backend
- **Ruby**: 3.4.5
- **Rails**: ~8.0.0
- **Database**: PostgreSQL
- **Web Server**: Puma (~6.0)

### Frontend
- **JavaScript**: ES6 with Import Maps
- **CSS Framework**: Bulma
- **Icons**: Font Awesome
- **Hotwire**: Turbo Rails + Stimulus Rails

### Authentication & Authorization
- **Devise**: User authentication system
- **CanCanCan**: Authorization framework

### Development & Testing
- **Testing Framework**: RSpec Rails
- **System Testing**: Capybara + Selenium WebDriver
- **Test Data**: FactoryBot
- **Database Cleaner**: DatabaseCleaner gem
- **Code Quality**: RuboCop, Stylelint
- **Performance**: Bullet gem (N+1 query detection)

### Additional Features
- **Friendly URLs**: FriendlyId gem for SEO-friendly slugs
- **Environment Variables**: Dotenv for configuration

## Project Structure

### Models
- **Customer**: User model with Devise authentication
  - Has many categories and deals
  - Validates name presence

- **Category**: Budget categories (e.g., Food, Transport)
  - Belongs to customer
  - Has and belongs to many deals (many-to-many relationship)
  - Uses FriendlyId for slugs
  - Validates name and icon presence

- **Deal**: Financial transactions
  - Belongs to author (Customer)
  - Has and belongs to many categories
  - Validates name presence and amount (non-negative numbers)

### Controllers
- **ApplicationController**: Base controller with Devise integration and CanCan error handling
- **SplashController**: Landing page
- **CategoriesController**: CRUD for categories (index, new, create)
- **DealsController**: CRUD for deals nested under categories (index, new, create)

### Database Schema
- PostgreSQL with foreign key constraints
- Many-to-many relationship between categories and deals via join table
- Uses UUIDs for some slug indexing

## Development Setup

### Prerequisites
- Ruby 3.1.2
- PostgreSQL
- Bundler

### Environment Variables
Required in `.env` file:
```
POSTGRES_USERNAME=your_username
POSTGRES_PASSWORD=your_password
```

For production (Render deployment):
```
DATABASE_NAME=elephantsql_database_name
DATABASE_USERNAME=elephantsql_database_username
DATABASE_PASSWORD=elephantsql_database_password
DATABASE_HOST=elephantsql_database_hostname
DATABASE_PORT=elephantsql_database_port
```

### Installation Commands
```bash
# Install dependencies
bundle install

# Setup database
rails db:create db:migrate

# Run the application
rails server

# Visit http://localhost:3000
```

### Testing Commands
```bash
# Run all tests
rspec

# Run specific test types
rspec spec/models/
rspec spec/features/
rspec spec/requests/
```

### Code Quality
```bash
# Ruby linting
rubocop

# CSS linting
npx stylelint "**/*.{css,scss}"
```

## Deployment

### Live Application
- **Production URL**: https://elsonotake-origami.onrender.com/
- **Platform**: Render.com
- **Database**: ElephantSQL (PostgreSQL)

### CI/CD
- **GitHub Actions**: Automated linting on pull requests
- **Linters**: RuboCop (Ruby), Stylelint (CSS)
- **Ruby Version**: 3.1.x in CI

## Application Features

### Current Features
- User registration and authentication
- Category creation with icons
- Transaction (deal) creation and tracking
- Budget categorization
- Mobile-responsive design

### Planned Features (Future)
- CRUD operations for Categories and Transactions
- Transaction details page
- Enhanced budget analytics

## Key Routes
```ruby
root 'splash#index'
devise_for :customers
resources :categories, only: [:index, :new, :create] do
  resources :deals, only: [:index, :new, :create]
end
```

## Important Notes

### Authentication
- Uses Devise with Customer model (not User)
- Custom parameter sanitization for name field
- CanCanCan for authorization (ability.rb model)

### Database Considerations
- Uses PostgreSQL in all environments
- Database cleaning strategy varies by test type (transaction vs truncation)
- Foreign key constraints enforced

### Asset Pipeline
- Uses Rails 7 import maps (no Webpack/Webpacker)
- Sprockets for asset compilation
- Bulma CSS framework loaded via CDN or gems

### Testing Strategy
- RSpec for unit and integration tests
- Capybara for system/feature tests
- FactoryBot for test data generation
- DatabaseCleaner for test isolation
- Devise test helpers included

### Code Style
- RuboCop configuration in `.rubocop.yml`
- Stylelint for CSS (Node.js based)
- GitHub Actions for automated linting

## Common Development Commands

```bash
# Database operations
rails db:migrate
rails db:seed
rails db:reset

# Rails console
rails console

# Generate migrations
rails generate migration AddColumnToTable column:type

# Generate models/controllers
rails generate model ModelName
rails generate controller ControllerName

# Run specific test files
rspec spec/models/customer_spec.rb
rspec spec/features/

# Check routes
rails routes
```

## Troubleshooting

### Common Issues
1. **Database connection**: Ensure PostgreSQL is running and credentials are correct
2. **Missing migrations**: Run `rails db:migrate`
3. **Test failures**: Check DatabaseCleaner setup and factory definitions
4. **Asset issues**: Verify import map configuration

### Debug Tools
- **Bullet gem**: Detects N+1 queries in development
- **Rails console**: `rails c` for interactive debugging
- **Rails logs**: Check `log/development.log`

## Contact & Resources
- **Author**: Elson Otake
- **GitHub**: https://github.com/elsonotake/Origami
- **Design Credit**: Gregoire Vella on Behance
- **Icons**: Monkik and Flaticon