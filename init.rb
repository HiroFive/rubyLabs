Parser_program.config do |parser_program|
    parser_program.web_address = "https://myanimelist.net/topanime.php"
    parser_program.web_address_login = "https://myanimelist.net/login.php?from=%2F"
    parser_program.numbers = 30
    parser_program.path = "#{__dir__}/savedFiles"
    parser_program.path_to_zip = "#{__dir__}/zipedFiles/"
    parser_program.file_ext = [".txt", ".json", ".csv", ".yaml"]
    parser_program.condition = ->(item) {item.rating == "8" }
    parser_program.rating = ["8"]


    parser_program.user do |user|
        user.email = "mishkomisha94@gmail.com"
        user.app_password = "!38FnJx.Mi5khuj"
        user.password = "!38FnJx.Mi5khuj"
    end

    puts parser_program
end
