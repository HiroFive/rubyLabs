module Parser_program
    class << self
      attr_accessor :web_address, :web_address_login, :file_ext, :user, :numbers, :path, :condition, :path_to_zip, :rating
  
      def config(&block)
        return to_s unless block_given?
  
        if @parser_program
          puts "\nCannot modify configuration\n"
          return
        end
  
        yield self
        @parser_program ||= self
        # Freeze the configuration if needed
        # @parser_program.freeze
      end
  
      def user(&block)
        @user ||= User.config(&block)
      end
  
      private
  
      def to_s
        str = "\nParser program config:\n"
        str += "    web_address: #{@web_address}\n" if @web_address
        str += "    path: #{@path}" if @path
        str += @user.config if @user
        str
      end
    end
  
    class User
      class << self
        attr_accessor :email, :password, :app_password
  
        def config(&block)
          return to_s unless block_given?
  
          return @user if @user
  
          yield self
          @user ||= self
          @user.freeze
        end
  
        private
  
        def to_s
          "\nUser config:\n    email: #{@email}\n\n"
        end
      end
    end
  end