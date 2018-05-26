[![Build Status](https://travis-ci.com/CS131-RVLC/korean-drama-db-team-kddb.svg?token=pWiDcpBsN1gB9Ymzyimy&branch=master)](https://travis-ci.com/CS131-RVLC/korean-drama-db-team-kddb)

# README for KDDB
Clone the repository and install the required gems by running `bundle install` on system's terminal

## For database:
1. Migrate - `rails db:migrate`
2. Load - `rails db:schema:load`
3. Seed - `rails db:seed`
4. Run using `rails s`

## Recommedations
### Search Functionality
* Add an option to list results using titles only instead of displaying the shows with their cover pictures.
* Add a pagination feature.
* Use of thumbnails in the search results page
* Add a filter for artists.
* Add validation for year filter. 
* Display also if may ENG, CHI, JAP subtitles.

### Display Drama Functionality
* Use of full sized pictures in the display drama page.
* Reviews: display the reviews in chronological order; latest post at the top.

### Add Drama Functionality
* Suggest people when adding casts.

### Others
* Recommendation system for dramas
* Unit tests using rspec.
* Some features which do not have tests yet.
* Use of Vagrant virtualization.
* Use listed gem versions from the Gemfile.lock file of the working project.









