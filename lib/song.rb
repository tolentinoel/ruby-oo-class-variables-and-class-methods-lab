class Song

    attr_accessor :name, :artist, :genre

    @@count = 0
    @@artists = []
    @@genres = []

    def initialize(name, artist, genre)
        @name, @artist, @genre = name, artist, genre

        @@count += 1
        @@artists << @artist
        @@genres << @genre
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        genre_hash = {}     #also works, but longer. Short hand would be ternary
        @@genres.each do |g|
            if genre_hash[g]
                genre_hash[g] += 1
            else
                genre_hash[g] = 1
            end
        end
        genre_hash
    end

    def self.artist_count 
        @@artists.reduce({}) do |hsh, artist|   #reduce into a hash, hsh will take in the value
            hsh[artist] ? hsh[artist] += 1 : hsh[artist] = 1
            hsh
        end
    end



end