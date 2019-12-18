require('rspec')
require('album.rb')

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      album2.save()
      expect(Album.all).to(eq([album2, album]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('.search_name') do
    it("finds an album by name") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      album2.save()
      expect(Album.search_name(album.name)).to(eq([album]))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album.update("A Love Supreme", 2000, "bluegrass", "old mcdonald")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#sold') do
    it("changes the status of the album") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      album.sold()
      expect(album.status).to(eq("sold"))
    end
  end

  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
      album.save()
      song = Song.new("Naima", album.id, nil)
      song.save()
      song2 = Song.new("Cousin Mary", album.id, nil)
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end

end
