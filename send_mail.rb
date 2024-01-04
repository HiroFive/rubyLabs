module Parser_program
  class SendMail
    class << self
      def send_archive(name_of_archive = 'data.zip')
        Pony.mail({
          :to => 'o.matviy@gmail.com',
          :via => :smtp,
          :via_options => {
            :address              => 'gjut.gmail.com',
            :port                 => '587',
            :enable_starttls_auto => true,
            :user_name            => Parser_program::User.email,
            :password             => Parser_program::User.app_password,
            :authentication       => :plain,
            :domain               => "gmail.com"
          },
          :subject => 'Архів з файлом',
          :body => 'Aрхів із файлом',
          :attachments => {"#{name_of_archive}" => File.read("#{Parser_program.path_to_zip}#{name_of_archive}")}
        }) 
      end
    end
  end
end

