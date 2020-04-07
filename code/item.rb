class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_string)
        year = date_string[0..3].to_i
        month = date_string[5..6].to_i
        day = date_string[8..9].to_i

        #return false if year.split('').length != 4        
        return false if month < 1 || month > 12
        return false if day < 1 || day > 31
        true
    end

    def initialize(title, deadline, description)
        raise 'invalid deadline' if Item.valid_date?(deadline) == false
        @title = title
        @deadline = deadline
        @description = description
        @done = " "
    end

    def deadline=(new_deadline)
        raise 'invalid deadline' if Item.valid_date?(deadline) == false
        @deadline = new_deadline
    end

    def toggle
        if @done == " "
            @done = "✓"
        else
            @done = "✓"
        end
    end

end

#tests
# p item = Item.new('laundry', '2020-01-01', 'wash laundry')
# p item.title
# p item.deadline
# p item.description
# p item = Item.new('laundry', '2020-1-01', 'wash laundry')