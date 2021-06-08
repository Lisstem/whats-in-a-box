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
## Usage
You can create your own booster boxes following the pattern from [booster.yaml](booster.yaml) and use
```ruby
require_relative 'booster_data'

boxes = load_file('booster.yaml')
puts boxes.inspect
```
to load the data (and print it).

To create overviews you can use the (basic) [template compiler](template_compiler.rb).
An example is given by [compile_template.rb](compile_template.rb).

To create the [boxes.md](boxes.md) from the [boxes.md.erb Template](boxes.md.erb) run
```
ruby compile_template boxes.md.erb booster.yaml
```
## License
[Blue Oak Model License 1.0.0](LICENSE.md)
