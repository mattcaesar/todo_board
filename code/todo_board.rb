require './item.rb'
require './list.rb'

class TodoBoard

    def initialize(label)
        @board = {}
        #@list = List.new(label)
    end

    def get_command
        puts
        puts "choose your action from these options:"
        puts "- mklist <new_list_label>"
        puts "- ls"
        puts "- showall"
        puts "- mktodo <list_label> <item_title> <item_deadline> <optional_item_description>"
        puts "- toggle <list_label> <item_index>"
        puts "- purge <list-label>"
        puts "- rm <list_label> <item_index>"        
        puts "- up <list_label> <item_index> <optional_amount>"
        puts "- down <list_label> <item_index> <optional_amount>"
        puts "- swap <list_label> <item_index_1> <item_index_2>"
        puts "- sort <list_label>"
        puts "- priority <list_label>"
        puts "- print <list_label> <optional index>"
        puts "- quit"
        @cmd, *selection = gets.chomp.split(' ')
    
        case @cmd
        when 'mklist'
            @board[selection[0]]= List.new(selection[0])
            true
        when 'ls'
            @board.keys.each { |label| puts label }
            true
        when 'showall'
            @board.values.each { |list| list.print }
            true
        when 'mktodo'
            @board[selection[0]].add_item(selection[1], selection[2], selection[3])
            true
        when 'toggle'
            @board[selection[0]].toggle(selection[1].to_i)
        when 'rm'
            @board[selection[0]].remove_item(selection[1].to_i)
        when 'purge'
            @board[selection[0]].purge
        when 'up'
            @board[selection[0]].up(selection[1].to_i) if selection[2] == nil
            @board[selection[0]].up(selection[1].to_i, selection[2].to_i) if selection[2] != nil
            true
        when 'down'
            @board[selection[0]].down(selection[1].to_i) if selection[2] == nil
            @board[selection[0]].down(selection[1].to_i, selection[2].to_i) if selection[2] != nil
            true
        when 'swap'
            @board[selection[0]].swap(selection[1].to_i, selection[2].to_i)
            true
        when 'sort'
            @board[selection[0]].sort_by_date!
            true
        when 'priority'
            @board[selection[0]].print_priority
            true
        when 'print'
            @board[selection[0]].print if selection[1] == nil
            @board[selection[0]].print_full_item(selection[1].to_i) if selection[1] != nil
            true
        when 'quit'
            false
        end   
    end

    def run
        continue = true
        until continue == false
            continue = self.get_command
        end
    end

end

my_list = TodoBoard.new("matt")
my_list.run