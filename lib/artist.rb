class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.find_all do |x|
            x.artist == self
        end
    end

    def add_song(song)
        song.artist=(self)
    end

    def self.find_or_create_by_name(name)
        names = Artist.all.collect{|x| x.name}
        if names.include?(name)
            artist = Artist.all.find{|x| x.name == name}
            artist
        else
            artist = Artist.new(name)
        end
    end

    def print_songs
        songs.each {|x| puts x.name}
    end

end