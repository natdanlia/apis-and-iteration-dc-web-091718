require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character, names)
  #make the web request

  names.each do |element_hash|

    if element_hash["name"] == character
      return get_user_films(element_hash["films"])
    end
  end

  puts "put a real character"

#   found_character = response_hash["results"].find do |key|
#       key["name"] == character
#   end
#     arr = []
#   if found_character == nil
#     puts "please enter a real character"
#   else
#   #  binding.pry
#     found_character.each do |character_hash|
#       character_hash["film"].each do |movie_url|
#         response_string = RestClient.get(movies_url)
#         response_hash = JSON.parse(response_string)
#           response_hash["title"] >> arr
#       end
#     end
#   end
#
# arr


  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  films_array.each do |e|
    puts e
  end
end


def get_character_list
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"]
end

def get_user_films(arr)
  list_of_films = []
  arr.each do |film_url|
    response_string = RestClient.get(film_url)
    response_hash = JSON.parse(response_string)
    list_of_films << response_hash["title"]
  end
  list_of_films
  ##puts "what"
end


def show_character_movies(character)
  names = get_character_list
  films_array = get_character_movies_from_api(character, names)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
