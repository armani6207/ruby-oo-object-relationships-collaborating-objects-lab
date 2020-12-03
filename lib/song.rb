require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        file = file.split("-")
        file.collect{|x| x.strip!}
        artist = file[0]
        name = file[1]
        genre = file[2].rpartition(".")[0]
        song = Song.new(name)
        song.artist_name=(artist)
        song
    end

    def artist_name=(name)
        names = Artist.all.collect{|x| x.name}
        if names.include?(name)
            artist = Artist.all.find{|x| x.name == name}
            self.artist=(artist)
            artist
        else
            self.artist=(Artist.new(name))
            self.artist
        end
    end
end