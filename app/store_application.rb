class StoreApplication

  class << self

    def config
      unless @instance
        yield(self)
        puts "loading files..."
        #puts self.class
        require_relative "string"
        require_relative "container"
        require_relative "item"
        require_relative "antique_item"
        require_relative "virt_item"
        require_relative "real_item"
        require_relative "cart"
        require_relative "order"
      end
      @instance ||= self
      @instance.freeze
    end

    attr_accessor :name, :enviroment

    def admin(&blok)
    @admin ||= Admin.new(&blok)
    end

  end

  class Admin

    class << self

      def new
        unless @instance
          yield(self)
        end
        @instance ||= self
        @instance.freeze
      end

      attr_accessor :email, :login

      def send_info_emails_on(day)
        @send_info_emails_on = day
      end

    end

  end

end