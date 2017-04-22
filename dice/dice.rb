#! /bin/ruby

class GameObject
  attr_accessor :name, :hp, :atk

  def initialize(init_name, init_hp, max_atk)
    @name = init_name
    @hp = init_hp
    @atk = max_atk
  end

  def attack
    rand(1..@atk)
  end

  def damage(dmg)
    @hp -= dmg
  end
end

class GameTask
  attr_accessor :objList

  def initialize(objects)
    @objList = objects
  end

  def game(playerHP)
    puts("Welcome to your Graveyard...")
    @objList.each_with_index do |obj, idx|
      puts("You Encount with " + obj.name)
      while obj.hp > 0
        puts("\n================================================================================")
        puts("PLAYER HP: " + playerHP.to_s())
        puts(obj.name + " HP: " + obj.hp.to_s())
        puts("What\'s a enemy\'s number...?")
        print("> ")
        num = STDIN.gets.to_i()
        enu = obj.attack()
        puts("Your number is " + num.to_s())
        puts(obj.name + "\'s number is " + enu.to_s())
        case num
        when enu then
          obj.damage(1)
          puts("Good. " + obj.name.to_s() + " damage!")
          puts((obj.hp + 1).to_s() + " => " + obj.hp.to_s())
        else
          playerHP -= 1
          puts("Bad. You damage.")
          puts((playerHP + 1).to_s() + " => " + playerHP.to_s())
          if playerHP <= 0 then
            puts("\n\nYou, Rest in peace...\n† GAME OVER †")
            return
          end
        end
      end
      puts("You win for " + obj.name.to_s())
      puts((objList.size() - idx - 1).to_s() + " monster\'s left.\n\n") if objList.size() != idx + 1
    end
    puts("\n\nCongratulations!!\nYou are STILL Arrive!\nGame Clear!!")
  end
end

if __FILE__ == $0
  monsters = [
    GameObject.new("SLIME", 1, 1),
    GameObject.new("WOLF", 2, 2),
    GameObject.new("DRAGON", 3, 3)
  ]
  task = GameTask.new(monsters)

  task.game(10)
end
