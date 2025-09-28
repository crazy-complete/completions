function _legendary_list_aliases
  set -l line

  command legendary alias list | begin
    builtin read line
    while builtin read line
      set line (string trim -l -c ' -' -- $line)
      string replace ' => ' \t $line
    end
  end
end

function _legendary_list_installed_games
  set -l line

  command legendary list-installed --tsv | begin
    builtin read line
    while builtin read line
      set -l split (string split -- \t "$line")
      builtin printf '%s\t%s\n' $split[1] $split[2]
    end
  end
end

function _legendary_list_available_games
  set -l line

  command legendary list --tsv | begin
    builtin read line
    while builtin read line
      set -l split (string split -- \t "$line")
      builtin printf '%s\t%s\n' $split[1] $split[2]
    end
  end
end
