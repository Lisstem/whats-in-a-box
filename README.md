# What's in a box?
A small project to calculate the average contents of default MTG Set and Draft Booster Boxes.
The results are shown [here](boxes.md).

## Installation
1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Install the [Bundler Gem](https://bundler.io/)
```
gem install bundler
```
3. Clone the repository
```
git clone https://github.com/Lisstem/whats-in-a-box.git
```
4. Move into the directory and install the required gems
```
cd whats-in-a-box && bundle install
```

## Generating booster data and overviews
First you need to compile the [booster data](booster.yaml.erb) by running
```
ruby compile_template booster.yaml.erb
```
After this you can compile the [overview](boxes.md.erb)
```
ruby compile_template boxes.md.erb booster.yaml
```

## Loading the booster data
To load the booster data you can use the load_file() method.
```ruby
require_relative 'booster_data'

boxes = BoosterData.load_file('booster.yaml')
puts boxes.inspect
```
This loads the data (and prints it).

## Creating your own boosters or overviews 
You can create your own boosters following the pattern in the compiled booster.yaml.
You can of course also write a template and compile it using the [template compiler](template_compiler.rb).
The same goes for the overviews just create a template and run it with the compiler and your booster data.

## License
[Blue Oak Model License 1.0.0](LICENSE.md)
