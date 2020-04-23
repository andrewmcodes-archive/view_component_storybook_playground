# README

## Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.6](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/.ruby-version#L1)
- Node [> 11](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/.nvmrc#L1)
- SQLite

### 1. Check out the repository

```bash
git clone git@github.com:andrewmcodes/view_component_storybook_playground.git
```

### 2. Setup

Run the following commands to install dependencies and set up the database.

```sh
bin/setup
```

### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bin/rails server
```

And now you can visit the site with the URL http://localhost:3000

## Walkthrough

Create a new rails app

```sh
rails new view_component_storybook_playground --skip-sprockets --skip-spring --webpack=erb
```

I also upgraded Webpacker to v5.1.1 in the [Gemfile](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/Gemfile#L13) and [package.json](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/package.json#L9)

Add ViewComponent

```sh
bundle add view_component
```

In [config/application.rb](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/config/application.rb#L17), add:

```ruby
require "view_component/engine"
```
