class BrowseController < ApplicationController
  def index
    @instruments = {
      strings: ["Violin", "Viola", "Cello", "Bass"],
      woodwinds_and_brass: ["Flute", "Piccolo", "Oboe", "Clarinet", "Bassoon", "Contrabassoon", "Horn", "Saxophone", "Trumpet", "Trombone", "Tuba"],
      keyboards: ["Piano", "Harpsichord", "Organ", "Harp"],
      percussion: ["Timpani", "Xylophone", "Marimba", "Vibraphone"],
      vocal: ["Soprano", "Mezzo-soprano", "Alto", "Countertenor", "Tenor", "Baritone"]
    }
  end
end
