extern crate rand;

use std::io;
use std::str;
use rand::Rng;

struct GameObject {
    name: &'static str,
    hp: i32,
    atk: i32,
}

impl GameObject {
    fn attack(&self) -> i32 {
        rand::thread_rng().gen_range(1, self.atk);
    }

    fn damage(&mut self, dmg: i32) {
        self.hp -= dmg;
    }
}

struct GameTask {
    objList: Vec<GameObject>,
}

impl GameTask {
    fn game(&mut self, mut playerHP: i32) {
        println!("Welcome to your Graveyard...");
        for obj in self.objList {
            println!("You Encount with {}", obj.name);
            loop {
                println!("\n================================================================================");
                println!("PLAYER HP: {}", playerHP.to_string());
                println!("{} HP: {}", obj.name, obj.hp.to_string());
                println!("What\'s a enemy\'s number...?");
                print!("> ");
                let num = io::stdin().read_line().unwrap().to_int();
                let enu = obj.attack();
                println!("Your number is {}", num.to_string());
                println!("{}\'s number is {}", obj.name, enu.to_string());
                if num == enu {
                    obj.damage(1);
                    println!("Good. {} damage!", obj.name.to_string());
                    println!("{} => {}", (obj.hp + 1).to_string(), obj.hp.to_string());
                } else {
                    playerHP -= 1;
                    println!("Bad. You damage.");
                    println!("{} => {}", (playerHP + 1).to_string(), playerHP.to_string());
                    if playerHP <= 0 {
                        println!("\n\nYou, Rest in peace...\n† GAME OVER †");
                        return;
                    }
                }
                if obj.hp <= 0 {
                    break;
                }
            }
            println!("You win for {}", obj.name.to_string());
        }
        println!("\n\nCongratulations!!\nYou are STILL Arrive!\nGame Clear!!");
    }
}

fn main() {
  let monsters = [
    GameObject { name: "SLIME", hp: 1, atk:1 },
    GameObject { name: "WOLF", hp: 2, atk: 2 },
    GameObject { name: "DRAGON", hp: 3, atk: 3 }
  ];
  let task = GameTask { objList: monsters };

  task.game(10);
}
