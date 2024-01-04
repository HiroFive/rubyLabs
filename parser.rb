module Parser_program
  class Parser 

    def self.parse_items(condition)
      items = [] 

      agent = Mechanize.new

      page = agent.get(Parser_program.web_address_login)
 
      form = agent.page.search('div.a-box-inner')
      #puts form
=begin
      # Вводимо логін та пароль
      form.login = Parser_program::User.email
      form.password = Parser_program::User.password

      # Надсилаємо форму
      result = form.submit

      page = agent.get(Parser_program.web_address)
      puts page
=end
      doc = Nokogiri::HTML(Faraday.get(Parser_program.web_address).body)
      rows = doc.css("tr.ranking-list") 


      rows.each_with_index do |row, index| 
        break if index == Parser_program.numbers 
      
        title = row.css("h3.anime_ranking_h3").text.sub(/^\d+\.\s*/, '')
        eps = row.css("div.information").text.strip[/\d+/]
        rawYears = row.css("div.information").text.match(/^[^\n]+\n([^\n]+)\n/)
        years = rawYears[1].gsub(/\A\s+|\s+\z/, '')
        rating = row.css("div.js-top-ranking-score-col span").text.to_f

        attributes = {
          title: title,
          eps: eps,
          years: years,
          rating: rating,
        }

        item = Item.new(attributes)
        next unless condition.call(item)

        puts "#{item}"

        items << item 
      end 
      items 
    end
  end
end