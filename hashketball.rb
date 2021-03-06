require 'pry'

def game_hash()
  game_hash = {
    :home => {:team_name => "Brooklyn Nets",
              :colors => ["Black", "White"],
              :players => { "Alan Anderson" => {:number => 0, :shoe => 16,   :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
              },
                          "Reggie Evans" => {:number => 30, :shoe => 14,   :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
                          },
                          "Brook Lopez" => {:number => 11, :shoe => 17,   :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
                          },
                          "Mason Plumlee" => {:number => 1, :shoe => 19,   :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
                          },
                          "Jason Terry" => {:number => 31, :shoe => 15,   :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
                          }
            }
    },
    :away => {:team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"],
              :players => { "Jeff Adrien" => {:number => 4, :shoe => 18,   :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
              },
                          "Bismak Biyombo" => {:number => 0, :shoe => 16,   :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10
                          },
                          "DeSagna Diop" => {:number => 2, :shoe => 14,   :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
                          },
                          "Ben Gordon" => {:number => 8, :shoe => 15,   :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
                          },
                          "Brendan Haywood" => {:number => 33, :shoe => 15,   :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12
                          }
            }

    }
  }
end

def num_points_scored(player)
  res = nil
  game_hash.each do |location, teams|
    teams.each do |team_k, team_v|
      if team_v.class == Hash
        team_v.each do |x,y|
          if x == player
            res = y[:points]
          end
        end
      end
    end
  end
  res
end

# num_points_scored("Bismak Biyombo")

def shoe_size(player)
  res = nil
  game_hash.each do |location, teams|
    teams.each do |team_k, team_v|
      if team_v.class == Hash
        team_v.each do |x,y|
          if x == player
            res = y[:shoe]
          end
        end
      end
    end
  end
  res
end

def team_colors(team)
  res = nil
  game_hash.each do |location, teams|
    teams.each do |team_k, team_v|
      if team_v == team
        res = teams[:colors]
      end
    end
  end
  res
end
# team_colors("Brooklyn Nets")

def team_names
  res = []
  game_hash.each do |loc,teams|
    res << teams[:team_name]
  end
  res
end
# team_names

def player_numbers(team)
  res = []
  game_hash.each do |loc,teams|
    if teams[:team_name] == team
      teams.each do |team_k, team_v|
        if team_v.class == Hash
          team_v.each do |x,y|
            # puts y[:number]
            y.each do |k,v|
              if k == :number
                res << v
              end
            end
          end
        end
      end
    end
  end
  res
end
# player_numbers("Brooklyn Nets")

def player_stats(player)
  res = nil
  game_hash.each do |loc, teams|
    teams.each do |team_k, data|
      if data.class == Hash
        data.each do |x,y|
          if x == player
            res = y
          end
        end
      end
    end
  end
  res
end

# player_stats("DeSagna Diop")

# players
def big_shoe_rebounds

  game_hash[:home][:players].merge(game_hash[:away][:players]).max_by{|player, stats| stats.fetch(:shoe)}[1][:rebounds]
end

# big_shoe_rebounds
