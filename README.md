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

add [view_component_storybook](https://github.com/jonspalmer/view_component_storybook)

```sh
bundle add view_component_storybook --group "development"
```

In [config/application.rb](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/config/application.rb#L18), add:

```ruby
require "view_component_storybook/engine" if ENV["RAILS_ENV"].inquiry.development?
```

Add `**/*.stories.json` to [.gitignore](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/.gitignore#L37)

```sh
echo '**/*.stories.json' >> .gitignore
```

Add Storybook server as a dev dependency.

```sh
yarn add @storybook/server @storybook/addon-knobs --dev
```

Add an NPM script to your package.json in order to start the storybook later in this guide

```json
{
 "scripts": {
   "storybook": "start-storybook"
 }
}
```

Create the [.storybook](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/.storybook) directory

```sh
mkdir .storybook
```

Create the [.storybook/main.js](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/.storybook/main.js) file to configure Storybook to find the json stories the gem creates. Also configure the knobs addon:

```sh
touch .storybook/main.js
```

```javascript
module.exports = {
 stories: ['../test/components/**/*.stories.json'],
 addons: [
   '@storybook/addon-knobs',
 ],
};
```

Create the [.storybook/preview.js](https://github.com/andrewmcodes/view_component_storybook_playground/blob/master/.storybook/preview.js) file to configure Storybook with the Rails application url to call for the html content of the stories

```sh
touch .storybook/preview.js
```

```javascript
import { addParameters } from '@storybook/server';

addParameters({
 server: {
   url: `http://localhost:3000/rails/stories`,
 },
});
```
