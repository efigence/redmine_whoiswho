# Redmine Whoiswho plugin [![Build Status](https://travis-ci.org/efigence/redmine_whoiswho.svg?branch=master)](https://travis-ci.org/efigence/redmine_whoiswho)

#### Plugin which adds users' bios.

## Requirements

Developed and tested on Redmine 3.0.3.

## Installation

1. Go to your Redmine installation's plugins/directory.
2. `git clone https://github.com/efigence/redmine_whoiswho`
3. Go back to root directory.
4. `rake redmine:plugins:migrate RAILS_ENV=production`
5. Restart Redmine.

## Usage

Admin should define which groups will be allowed to use Whoiswho plugin.

Defined group members will be able to create their personal bios (including contact information). Bios menu button will direct them to list of all bios.


## License

    Redmine Whoiswho plugin
    Copyright (C) 2015 efigence S.A.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
