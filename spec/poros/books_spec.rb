require 'rails_helper'

RSpec.describe Books do
  describe "it exists and has attributes" do
    it "can be created with proper data", :vcr do
      data = {
        :key=>"/subjects/denver",
        :name=>"denver",
        :subject_type=>"subject",
        :work_count=>20,
        :works=>
          [
            {:key=>"/works/OL2766605W",
            :title=>"The Regis santos",
            :edition_count=>3,
            :cover_id=>1694386,
            :cover_edition_key=>"OL708367M",
            :subject=>
              ["Catalogs",
                "Folk art",
                "Santos (Art)",
                "Art collections",
                "Regis University (Denver, Colo.)",
                "Ethnic studies",
                "Exhibition catalogues and specific collections",
                "History Of Art / Art & Design Styles",
                "Museum, historic sites, gallery & art guides",
                "Hispanic Art",
                "Colorado",
                "Permanent Collection Catalogs",
                "Art",
                "Art & Art Instruction",
                "Collections, Catalogs, Exhibitions - General",
                "Folk & Outsider Art",
                "Criticism",
                "Subjects & Themes - General",
                "New Mexico",
                "Denver"],
            :ia_collection=>[],
            :lendinglibrary=>false,
            :printdisabled=>false,
            :lending_edition=>"",
            :lending_identifier=>"",
            :authors=>[{:key=>"/authors/OL406949A", :name=>"Thomas J. Steele"}, {:key=>"/authors/OL407128A", :name=>"Barbe Awalt"}, {:key=>"/authors/OL1240313A", :name=>"Paul Fisher Rhetts"}],
            :first_publish_year=>nil,
            :ia=>nil,
            :public_scan=>false,
            :has_fulltext=>false,
            :checked_out=>false},
           {:key=>"/works/OL1439708W",
            :title=>"The revolt of modern youth",
            :edition_count=>3,
            :cover_id=>nil,
            :subject=>["Juvenile delinquency", "Sexual ethics", "Denver", "Denver. Juvenile Court of the City and County of Denver", "Denver (Colo). Juvenile Court of the City and County of Denver", "Denver (Colo)"],
            :ia_collection=>[],
            :lendinglibrary=>false,
            :printdisabled=>false,
            :lending_edition=>"",
            :lending_identifier=>"",
            :authors=>[{:key=>"/authors/OL150590A", :name=>"Ben B. Lindsey"}],
            :first_publish_year=>nil,
            :ia=>nil,
            :public_scan=>false,
            :has_fulltext=>false,
            :checked_out=>false},
           {:key=>"/works/OL3404420W",
            :title=>"Exotic and irrational",
            :edition_count=>2,
            :cover_id=>740871,
            :cover_edition_key=>"OL8584347M",
            :subject=>
             ["Opera",
              "Social life and customs",
              "Genres & Styles - Opera",
              "History & Criticism - General",
              "Music / History & Criticism",
              "Music-Genres & Styles - Opera",
              "Music/Songbooks",
              "Music",
              "Colorado",
              "Denver",
              "Denver (Colo.)"],
            :ia_collection=>[],
            :lendinglibrary=>false,
            :printdisabled=>false,
            :lending_edition=>"",
            :lending_identifier=>"",
            :authors=>[{:key=>"/authors/OL558147A", :name=>"Young, Allen"}, {:key=>"/authors/OL1175532A", :name=>"Allen Young"}],
            :first_publish_year=>nil,
            :ia=>nil,
            :public_scan=>false,
            :has_fulltext=>false,
            :checked_out=>false},
           {:key=>"/works/OL1439707W",
            :title=>"The dangerous life",
            :edition_count=>2,
            :cover_id=>nil,
            :subject=>["Child welfare", "Denver", "Denver. Juvenile Court of the City and County of Denver"],
            :ia_collection=>[],
            :lendinglibrary=>false,
            :printdisabled=>false,
            :lending_edition=>"",
            :lending_identifier=>"",
            :authors=>[{:key=>"/authors/OL150590A", :name=>"Ben B. Lindsey"}],
            :first_publish_year=>nil,
            :ia=>nil,
            :public_scan=>false,
            :has_fulltext=>false,
            :checked_out=>false},
           {:key=>"/works/OL7099888W",
            :title=>"Monster Solution",
            :edition_count=>1,
            :cover_id=>2699837,
            :cover_edition_key=>"OL11709103M",
            :subject=>["children's book", "monsters", "Sara Goodman Zimet", "Shannon Parish", "full color", "illustrated", "Denver", "CO", "Sleep", "Juvenile fiction", "Fiction", "Bedtime", "Monsters"],
            :ia_collection=>[],
            :lendinglibrary=>false,
            :printdisabled=>false,
            :lending_edition=>"",
            :lending_identifier=>"",
            :authors=>[{:key=>"/authors/OL2010374A", :name=>"Sara Goodman Zimet"}],
            :first_publish_year=>nil,
            :ia=>nil,
            :public_scan=>false,
            :has_fulltext=>false,
            :checked_out=>false}],
        :ebook_count=>20
      }

      forecast = WeatherService.new('denver,co', '/data/2.5/onecall').get_forecast

      books = Books.new(data, forecast)
      expect(books).to be_an_instance_of Books
      expect(books.destination).to eq('denver')
      expect(books.forecast).to be_a Hash
      expect(books.total_books_found).to eq(20)
      expect(books.books).to be_a Array
    end
  end
end
